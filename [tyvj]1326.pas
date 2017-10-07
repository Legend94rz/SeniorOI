var
	tot,i,n,m,x,y,z:longint;
	next,head,ed,e:array[0..100000]of longint;
	q:array[0..50001]of longint;
	l,r:longint;
	vis:array[0..10001]of boolean;
	d:array[0..10001]of longint;
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
	ege,b,k:longint;
begin
	l:=0;r:=1;q[r]:=1;
	vis[1]:=true;
	fillchar(d,sizeof(d),$7f);d[1]:=0;
	repeat
		inc(l);
		if l>=50000 then l:=1;
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
								if r>=50000 then r:=1;
								q[r]:=b;
								vis[b]:=true;
							end;
					end;
				ege:=next[ege];
			end;
	until l=r;
end;
begin
	read(n);
	read(m);
	for i:=1 to m do
		begin
			read(x,y,z);
			add(x,y,z);
		end;
	spfa;
	writeln(d[n]);
end.

