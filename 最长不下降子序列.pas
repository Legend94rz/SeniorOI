var
	f,a:array[0..6000]of longint;
	i,j,k,l,n:longint;
begin
	readln(n);
	for i:=1 to n do
		begin
		read(a[i]);
		f[i]:=1;
		end;
	for i:=n-1 downto 1 do
	begin
		l:=0;
		for j:=i+1 to n do
			if (a[j]>=a[i])and(f[j]>l)then
				l:=f[j];
		if l>0 then
			f[i]:=l+1;
	end;
	for i:=2 to n do
		if f[i]>f[1] then
			f[1]:=f[i];
                //write(f[i],' ');
	writeln(f[1]);
end.
