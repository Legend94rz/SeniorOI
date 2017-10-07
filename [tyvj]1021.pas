var
	i,j,n:longint;
	ans:qword;
	a,sum:array[0..10000]of int64;
begin
	readln(n);
	for i:=1 to n do
		readln(a[i]);
	for i:=1 to n-1 do
		for j:=i+1 to n do
			sum[i]:=sum[i]+abs(a[i]-a[j]);
	for i:=1 to n do
		ans:=ans+sum[i];
	ans:=ans*2;
	writeln(ans);
end.
