uses math;
var
	i,j:longint;
	n,m:int64;
	c:array[-1..100,-1..100]of int64;
	ans:int64;
function cal(n,m:longint):int64;
var
	t:longint;
	temp:int64;
begin
	t:=n-m-1;if t<0 then t:=1;
	cal:=9**(n-m)*c[n-1,m-1]+8*c[n-1,m]*9**t;
end;
begin
	readln(n);
	c[0,0]:=1;
	for i:=1 to 20 do
		for j:=0 to i do
			c[i,j]:=c[i-1,j]+c[i-1,j-1];
	i:=0;
	while i<=n do
		begin
			ans:=ans+cal(n,i);
			inc(i,2);
		end;
	writeln(ans);
end.

