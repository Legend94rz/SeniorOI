uses
	math;
var
	i,j,n,m,s,t:longint;
	d:array[1..2,0..10000]of longint;
	vis:array[0..10000]of boolean;
	q:array[0..1000001]of longint;
	l,r:longint;
	tot,x,y,z,ans:longint;
	next,head,ed,e:array[0..20000]of longint;
	c:longint;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure spfa(s:longint);
var
	ege,k,b:longint;
begin
	inc(c);
	fillchar(vis,sizeof(vis),0);vis[s]:=true;
	l:=0;r:=1;q[r]:=s;
	fillchar(d[c],sizeof(d[c]),$7f);d[c,s]:=0;
	repeat
		inc(l);if l>=1000000 then l:=1;
		k:=q[l];vis[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				if d[c,k]+e[ege]<d[c,b] then
					begin
						d[c,b]:=d[c,k]+e[ege];
						if not vis[b] then
							begin
								inc(r);
								if r>=1000000 then r:=1;
								q[r]:=b;
								vis[b]:=true;
							end;
					end;
				ege:=next[ege];
			end;
	until l=r;
end;
begin
	readln(n,m);
	for i:=1 to m do
		begin
			readln(x,y,z);
			add(x,y,z);
			add(y,x,z);
		end;
	readln(s,t);
	spfa(s);spfa(t);
	ans:=maxlongint;
	for i:=1 to n do
		if max(d[1,i],d[2,i])<ans then
			ans:=max(d[1,i],d[2,i]);
	if ans<>$7f7f7f7f then
		writeln(ans)
	else
		writeln('Peace!');
end.

