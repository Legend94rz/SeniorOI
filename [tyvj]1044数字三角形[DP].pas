var
	i,j,n,m:longint;
	a,f:array[0..200,0..200]of longint;
begin
	readln(n);
	for i:=1 to n do
		for j:=1 to i do
			read(a[i,j]);
	for i:=1 to n do f[n,i]:=a[n,i];
	for i:=n-1 downto 1 do
		for j:=1 to i do
			begin
				f[i,j]:=f[i+1,j]+a[i,j];
	            if f[i+1,j+1]+a[i,j]>f[i,j] then
					f[i,j]:=f[i+1,j+1]+a[i,j];
			end;
	writeln(f[1,1]);
end.

