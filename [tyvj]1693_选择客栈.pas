{
大体的算法是：
	颜色相同，但不能配对的是在同一个由"1"组成的连通块中
	我们统计在同一个"1"的连通块中，每种颜色各有多少，
	那么，对于一个连通块的一种颜色来说(设这种颜色在这个连通块里有x个)，不合题目要求的就是C(x,2)。
}
var
	i,j,n,k,p,x,y:longint;
	a:array[0..200001]of boolean;
	color:array[0..200001]of longint;
	m:array[0..51]of longint;
	ans:int64;
begin
	readln(n,k,p);
	for i:=1 to n do
		begin
			readln(x,y);
			a[i]:=y>p;
			color[i]:=x;inc(m[x]);
		end;
	for i:=0 to k-1 do ans:=ans+m[i]*(m[i]-1) shr 1;
	fillchar(m,sizeof(m),0);
	for i:=1 to n+1 do
		if a[i] then
			inc(m[color[i]])
		else
			begin
				for j:=0 to k-1 do ans:=ans-(m[j]-1)*m[j] shr 1;
				fillchar(m,sizeof(m),0);
			end;
	writeln(ans);
end.
