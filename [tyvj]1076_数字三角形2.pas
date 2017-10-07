var
	i,j,n,m,k,l:longint;
	a:array[0..101,0..101]of longint;
	f:array[0..101,0..101,0..101]of boolean;
begin
	readln(n);
	for i:=1 to n do
		for j:=1 to i do
			read(a[i,j]);
	for i:=1 to n do f[n,i,a[n,i] mod 100]:=true;
	for i:=n-1 downto 1 do
		for j:=1 to i do
			for k:=0 to 1 do
				for l:=0 to 99 do
					if f[i+1,j+k,l] then
						f[i,j,(l+a[i,j])mod 100]:=true;
	for i:=99 downto 0 do
		if f[1,1,i] then
			begin
				writeln(i);
				exit;
			end;
end.

