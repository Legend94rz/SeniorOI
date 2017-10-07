var
	i,j,l,n:longint;
	f,s,a:array[0..1000]of longint;
	ans:longint;
begin
	while not eoln do
		begin
			inc(n);
			read(a[n]);
		end;
	for i:=1 to n do
		begin
			f[i]:=1;
			s[i]:=1;	
		end;
	for i:=n-1 downto 1 do
		begin
			l:=0;
			for j:=i+1 to n do
				begin
					if (f[j]>l) and(a[j]<a[i]) then
						l:=f[j];
					if l>0 then
						f[i]:=l+1;
				end;
			if f[i]>ans then ans:=f[i];
		end;
	write(ans,' ');
	ans:=0;
	for i:=1 to n do
		begin
			l:=0;
			for j:=i-1 downto 1 do
				begin
					if (s[j]>l)and(a[j]<a[i]) then
						l:=s[j];
					if l>0 then
						s[i]:=l+1;
				end;
			if s[i]>ans then ans:=s[i];
		end;
	writeln(ans);
end.
