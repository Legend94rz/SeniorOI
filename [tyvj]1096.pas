var
	i,j,n,m:longint;
	f:array[0..10000]of longint;
	a:array[0..101]of longint;
begin
	readln(n,m);
	for i:=1 to n do
		read(a[i]);
	f[0]:=1;
	for i:=1 to n do
		for j:=m downto a[i] do
			inc(f[j],f[j-a[i]]);
	writeln(f[m]);
end.

