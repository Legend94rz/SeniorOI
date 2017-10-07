const
	none='Dangerous!';
var
	i,j,n:longint;
	c,d:array[0..300000]of longint;
	head,ed,e,next:array[0..3000000]of longint;
	tot,p,w:longint;
	a:array[0..600,0..600]of longint;
	q:array[0..3000001]of longint;
	l,r:longint;
	vis:array[0..300000]of boolean;
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
	ege,k,b:longint;
begin
	fillchar(d,sizeof(d),$7f);d[0]:=0;
	l:=0;r:=1;q[r]:=0;vis[0]:=true;
	repeat
		inc(l);if l>=3000000 then l:=1;
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
								inc(r);if r>=3000000 then r:=1;
								q[r]:=b;
								vis[b]:=true;
							end;
					end;
				ege:=next[ege];
			end;
	until l=r;
end;
begin
	readln(n,p);
	for i:=1 to n do
		for j:=1 to n do
			read(a[i,j]);
	for i:=1 to p do read(c[i]);
	readln(w);
	for i:=1 to n do
		for j:=1 to n do
			begin
				if (a[i,j+1]<>0)and(a[i,j+1]<>a[i,j]) then
					begin
						add(a[i,j],a[i,j+1],c[a[i,j+1]]);
						add(a[i,j+1],a[i,j],c[a[i,j]]);
					end;
				if (a[i+1,j]<>0)and(a[i+1,j]<>a[i,j]) then
					begin
						add(a[i,j],a[i+1,j],c[a[i+1,j]]);
						add(a[i+1,j],a[i,j],c[a[i,j]]);
					end;
			end;
	for i:=1 to n do add(0,a[1,i],c[a[1,i]]);
	for i:=1 to n do add(a[n,i],p+1,0);
	spfa;
	if w>d[p+1] then
		writeln(w-d[p+1])
	else
		writeln(none);
end.

