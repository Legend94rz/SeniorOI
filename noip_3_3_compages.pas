var
	i,j,n,m:longint;
	f,a:array[0..2000] of longint;
begin
	readln(n,m);
	for i:=1 to n do
		read(a[i]);
	f[0]:=1;
	for i:=1 to n do
		for j:=m downto a[i] do
			inc(f[j],f[j-a[i]]);
	writelN(f[m]);
end.
