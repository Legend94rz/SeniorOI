const
	dx:array[1..2]of longint=(0,1);
	dy:array[1..2]of longint=(1,0);
	di:array[1..8]of longint=(-1,1,2,2,-2,-2,-1,1);
	dj:array[1..8]of longint=(-2,-2,-1,1,-1,1,2,2);
var
	i,j:longint;
	ans:int64;
	map:array[0..100,0..100]of boolean;
	n,m,xa,xb,xc,yc:longint;
procedure dfs(x,y:longint);
var
	k:longint;
begin
	if (x=n)and(y=m)then
		begin
			inc(ans);
			exit;
		end;
	for k:=1 to 2 do
		if (not map[x+dx[k],y+dy[k]])and(y+dy[k]<=m)and(x+dx[k]<=n) then
			dfs(x+dx[k],y+dy[k]);
end;
begin
	readln(n,m,xc,yc);
	map[xc,yc]:=true;
	for i:=1 to 8 do
		map[xc+di[i],yc+dj[i]]:=true;
	dfs(0,0);
	writeln(ans);
end.
