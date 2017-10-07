var
	i,j,n,s,x:longint;
	a:array[0..1005]of longint;
	f:array[0..1001,-1000..1000]of longint;
begin
	readln(n);
	for i:=1 to n do
		read(a[i]);
	for i:=1 to n do
		for j:=i-1 downto 1 do
			begin
				x:=a[i]-a[j];
				s:=(s+f[j,x])mod 9901;
				f[i,x]:=(f[i,x]+f[j,x]+1)mod 9901;
			end;
	s:=(s + (n+1)*n div 2)mod 9901;
	writeln(s);
end.

