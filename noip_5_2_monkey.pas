{
全错位排列问题，递推公式
f(n)=(n-1)*(f(n-1)+f(n-2))
f[1]=0;f[2]=1;f[3]=2;f[4]=9;
}
var
	//a:array[0..150]of longint;
	i,j,n,m:longint;
	usd:array[0..150]of boolean;
	ans:qword;
procedure dfs(i:longint);
var
	j,k:longint;
begin
	if i>n then exit;
	for k:=1 to n do
		if (not usd[k])and(i<>k) then	
			begin
				usd[k]:=true;
				if i=n then
					inc(ans);
				dfs(i+1);
				usd[k]:=false;	
			end;
end;
begin
	readln(n);
	dfs(1);
	writeln(ans);
end.