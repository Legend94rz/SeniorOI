var
	i,j,n,m:longint;
	ans:longint;
	a:array[0..101]of longint;
procedure dfs(x,s:longint);
var
	i:longint;
begin
	if x=n+1 then
		begin
			if (s>=m)and(s-m<ans) then ans:=s-m;
			exit;
        end;
	dfs(x+1,s);
	dfs(x+1,s+a[x]);
end;
begin
	readln(n,m);ans:=$3f3f3f3f;
	for i:=1 to n do
		readln(a[i]);
	dfs(1,0);
	writeln(ans);
end.

