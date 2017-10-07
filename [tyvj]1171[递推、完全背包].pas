program ty1171;
var
	i,j,n:longint;
	f:array[0..100]of longint;
begin
	readln(n);
	f[0]:=1;
	for I:=1 to n-1 do
		for j:=i to n do
			inc(f[j],f[j-i]);
	writeln(f[n]);
end.
