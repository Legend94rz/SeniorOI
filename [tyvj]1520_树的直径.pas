var
	i,j,n,m,tot,x,y,z:longint;
	q,d:array[0..100001]of longint;
	//v:array[0..100001]of boolean;
	head,ed,e,next:array[0..100001]of longint;
procedure bfs(s:longint);
var
	b,k,ege:longint;
	l,r:longint;
begin
	l:=0;r:=1;q[r]:=s;
	fillchar(d,sizeof(d),$3f);d[s]:=0;
	repeat
		inc(l);if l>=100000 then l:=1;
		k:=q[l];
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				if d[k]+e[ege]<d[b] then
					begin
						d[b]:=e[ege]+d[k];
						inc(r);if r>=100000 then r:=1;
						q[r]:=b;
                    end;
				ege:=next[ege];
			end;
	until l=r;
end;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
begin
	readln(n);
	for i:=1 to n-1 do
		begin
			readln(x,y,z);
			add(x,y,z);add(y,x,z);
		end;
	bfs(1);x:=1;
	for i:=2 to n do
		if d[i]>d[x] then
			x:=i;
	bfs(x);x:=1;
	for i:=2 to n do
		if d[i]>d[x] then
			x:=i;
	writeln(d[x]);
end.

