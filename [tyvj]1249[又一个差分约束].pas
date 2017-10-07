var
	i,j,n,m,tot:longint;
	next,head,e,ed:array[0..50005]of longint;
	x,y,z:longint;
	ind:array[0..2000]of boolean;
	q:array[0..100001]of longint;
	l,r:longint;
	d,count:array[0..2000]of longint;
	vis:array[0..2000]of boolean;
procedure spfa;
var
	i,k,ege,b:longint;
	min:longint;
begin
	min:=$3f3f3f3f;
	repeat
		inc(l);
		if l>=100000 then l:=1;
		k:=q[l];vis[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				if d[k]+e[ege]<d[b] then
					begin
						d[b]:=d[k]+e[ege];
						if not vis[b] then
							begin
								inc(r);
								if r>=100000 then r:=1;
								q[r]:=b;
								inc(count[b]);
								if count[b]>n then
									exit;
								vis[b]:=true;
							end;
					end;
				ege:=next[ege];
			end;
	until l=r;
	for i:=1 to n do
		if d[i]<min then
			min:=d[i];
	writeln(-min);
	halt;
end;
procedure add(x,y,z:longint);
begin
	inc(tot);ind[y]:=true;
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
begin
	readln(n,m);
	for i:=1 to m do
		begin
			read(x,y,z);
			case z of
				-1:add(y,x,-1);
				0:begin add(y,x,0);add(x,y,0);end;
				1:add(x,y,-1);
				end;
		end;
	fillchar(d,sizeof(d),$3f);
	for i:=1 to n do
		add(0,i,0);
	r:=1;q[1]:=0;d[0]:=0;vis[0]:=true;
	spfa;
	writeln('NO');
end.

