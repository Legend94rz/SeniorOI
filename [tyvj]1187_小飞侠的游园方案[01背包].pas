var
	i,j,n,m:longint;
	f,a,v:array[0..200001]of longint;
begin
	readln(n);
	readln(m);
	for i:=1 to n do
		readln(a[i],v[i]);
	for i:=1 to n do
		for j:=m downto v[i] do
			if f[j-v[i]]+a[i]>f[j] then
				f[j]:=f[j-v[i]]+a[i];
	writeln(f[m]);
end.

