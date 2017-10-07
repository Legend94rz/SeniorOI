type
	node=record
		no,count:longint;
		end;
var
	i,j,n,m:longint;
	d:array[0..101,0..51]of double;
	tot,x:longint;
	head,e,ed,next:array[0..100001]of longint;
function mi(a,b:Longint):longint;
begin
	mi:=1;
	while b>0 do
		begin
			if b and 1 =1 then mi:=mi*a;
			a:=a*a;
			b:=b shr 1;
		end;
end;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;
	e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure spfa;
var
	l,r,b,ege,i,j,t:longint;
	q:array[0..10001]of node;
	v:array[0..1001,0..51]of boolean;
	k:node;
begin
	l:=0;r:=1;q[r].no:=1;q[r].count:=0;
	fillchar(v,sizeof(v),0);v[1,0]:=true;
	for i:=1 to n do
		for j:=0 to m do
			d[i,j]:=$3f3f3f3f;
	d[1,0]:=0;
	repeat
		inc(l);if l>=10000 then l:=1;
		k:=q[l];
		ege:=head[k.no];
		while ege<>0 do
			begin
				b:=ed[ege];
				for i:=k.count to m do
					begin
						t:=mi(2,i-k.count);
						if d[k.no,k.count]+e[ege]/t<d[b,i] then
							begin
								d[b,i]:=d[k.no,k.count]+e[ege]/t;
								if not v[b,i] then
									begin
										inc(r);if r>=10000 then r:=1;
										q[r].no:=b;q[r].count:=i;
										v[b,i]:=true;
									end;
							end;
					end;
				ege:=next[ege];
			end;
	until l=r;
	writeln(d[n,m]:0:2);
end;
begin
	assign(input,'city.in');reset(input);assign(output,'city.out');rewrite(output);
	readln(n,m);
	for i:=1 to n do
		for j:=1 to n do
			begin
				read(x);
				if x<>0 then begin add(i,j,x);add(j,i,x);end;
			end;
	spfa;
	close(output);
end.
