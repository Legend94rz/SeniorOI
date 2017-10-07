uses math;
var
	i,j,n,m:longint;
	sum1,sum2:int64;
begin
	readln(n,m);
	for i:=1 to n-1 do sum1:=sum1+(n-1) div i;
	for i:=1 to m do sum2:=sum2+m div i;
	writeln(sum2-sum1);
end.

