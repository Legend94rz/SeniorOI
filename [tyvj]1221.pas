var
	tot,i,j,n,m,s:longint;
	x,y,z:longint;
	next,head,ed,e:array[0..1000001]of longint;
	q:array[0..1000001]of longint;
	l,r:longint;
	vis:array[0..1001]of boolean;
	d:array[0..1001]of longint;
	ans:int64;
	f:array[0..1001,0..1001]of boolean;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure spfa;
var
	ege,k,b:longint;
begin
	fillchar(d,sizeof(d),$3f);
	d[s]:=0;L:=0;r:=1;q[r]:=s;vis[s]:=true;
	repeat
		inc(l);if l>=1000000 then l:=1;
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
								inc(r);if r>=1000000 then r:=1;
								q[r]:=b;
								vis[b]:=true;
							end;
					end;
				ege:=next[ege];
			end;
	until l=r;
	for i:=1 to n do
		if d[i]=$3f3f3f3f then
			begin
				writeln('Sth wrong.');
				exit;
			end
		else
			inc(ans,d[i]);
	writeln(ans,' M(s) are needed.');
end;
begin
	readln(n,s,m);
	for i:=1 to m do
		begin
			readln(x,y,z);
			add(x,y,z);add(y,x,z);
		end;
	spfa;
end.

