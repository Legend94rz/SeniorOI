var
	i,j,n,m:longint;
	f:array[0..200001]of boolean;
	a:array[0..100]of longint;
begin
	readln(m);
	readln(n);
	for i:=1 to n do
		readln(a[i]);
	f[0]:=true;
	for i:=1 to n do
		for j:=m downto a[i] do
			if f[j-a[i]] then
				f[j]:=true;
	for i:=m downto 0 do
		if f[i] then
			begin
				writeln(m-i);
				break;
			end;
end.

