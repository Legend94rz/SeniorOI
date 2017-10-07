var
	i,j,n,m:longint;
	f:array[-1..21]of int64;
begin
	readln(n);
	for i:=1 to n do readln;f[0]:=1;
	for i:=1 to n do f[i]:=(i-1)*(f[i-1]+f[i-2]);
	writeln(f[n]);
end.

