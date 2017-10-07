var
	i,j,n,m,t:longint;
	s,a,g,f:array[0..200001]of int64;
begin
	readln(n);
	for i:=1 to n do
		begin
		    read(a[i]);
			s[i]:=s[i-1]+a[i];
		end;
	for i:=1 to n do
		for j:=i downto 1 do
			if (s[i]-s[j-1]>=g[j-1])and(f[j-1]+1>f[i]) then
				begin
					f[i]:=f[j-1]+1;
					g[i]:=s[i]-s[j-1];
					break;
				end;
	writeln(n-f[n]);
end.

