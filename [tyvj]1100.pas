var
	i,j,n,m:longint;
	f:array[0..20000005]of boolean;
	a:array[0..100]of longint;
begin
	readln(n,m);
	for i:=1 to n do
		readln(a[i]);
	f[0]:=true;
	for i:=1 to n do
		for j:=m+a[i] downto a[i] do
			if f[j-a[i]] then
				f[j]:=true;
	for I:=m to 2*m do
		if f[i] then
			begin
				writeln(i-m);
				break;
			end;
end.

