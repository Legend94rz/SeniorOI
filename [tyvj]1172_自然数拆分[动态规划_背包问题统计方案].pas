const
	p=2147483648;
var
	i,j,n,m:longint;
	f:array[0..4001]of int64;
begin
	readln(n);
	f[0]:=1;
	for i:=1 to n-1 do
		for j:=i to n do
			f[j]:=(f[j]+f[j-i])mod p;
	writeln(f[n]);
end.

