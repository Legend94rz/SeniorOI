var
	i,j,n,m,x,y,z,w,t,ans:longint;
	a:array[0..10]of longint;
	v:array[0..10]of boolean;
	d:array[0..10,0..10,0..10]of longint;
procedure calc;
var
	t,i:longint;
begin
	t:=0;
    if d[a[1],a[2],a[3]]<>-1 then t:=d[a[1],a[2],a[3]] else exit;
	if d[a[4],a[5],a[6]]<>-1 then t:=t+d[a[4],a[5],a[6]] else exit;
	if d[a[7],a[8],a[9]]<>-1 then t:=t+d[a[7],a[8],a[9]] else exit;
	//for i:=1 to 9 do write(a[i]);writeln('>>>',t);
	if t>ans then ans:=t;
end;
procedure dfs(x:longint);
var
	i:longint;
begin
	if x=10 then
		begin
			calc;
			exit;
		end;
	for i:=1 to 9 do
		if not v[i] then
		begin
			a[x]:=i;
			v[i]:=true;
			dfs(x+1);
			v[i]:=false;
		end;
end;
begin
	readln(n);ans:=-1;
	fillchar(d,sizeof(d),$FF);
	for i:=1 to n do
		begin
			readln(x,y,z,w);
			d[x,y,z]:=w;d[x,z,y]:=w;
			d[y,x,z]:=w;d[y,z,x]:=w;
			d[z,x,y]:=w;d[z,y,x]:=w;
        end;
	dfs(1);
	if ans <>-1 then
		writeln(ans)
	else
		writeln('Impossible');
end.

