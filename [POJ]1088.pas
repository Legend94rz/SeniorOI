const
	dx:array[1..4]of longint=(-1,0,1,0);
	dy:array[1..4]of longint=(0,-1,0,1);
var
	a,f:array[0..200,0..200]of longint;
	i,j,n,m,max:longint;
function dfs(x,y,p:longint):longint;
var
	i:longint;
begin
	if f[x,y]<p then f[x,y]:=p else exit;
	for i:=1 to 4 do
		if a[x,y]<a[x+dx[i],dy[i]+y] then
			dfs(x+dx[i],y+dy[i],f[x,y]+1);
end;
begin
	readln(n,m);
	fillchar(a,sizeof(a),0);
	for i:=1 to n do
		for j:=1 to m do
			begin
			read(a[i,j]);
			f[i,j]:=0;
			end;
	for i:=1 to n do
		for j:=1 to m do
			dfs(i,j,1);
	for i:=1 to n do
		for j:=1 to m do
			if f[i,j]>max then
				max:=f[i,j];
	writelN(max);
end.
