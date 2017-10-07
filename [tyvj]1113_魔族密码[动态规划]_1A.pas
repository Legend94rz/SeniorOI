var
	i,j,n,m,t:longint;
	f:array[0..2001]of longint;
	s:array[0..2001]of string[80];
begin
	readln(n);
	for i:=1 to n do readln(s[i]);
	for i:=1 to n do
		begin
			t:=0;
			for j:=i-1 downto 1 do
				if (pos(s[j],s[i])=1)and(f[j]>t) then
					begin
		                t:=f[j];
						//break;
					end;
			f[i]:=t+1;
        end;
	for i:=2 to n do
		if f[i]>f[1] then
			f[1]:=f[i];
	writeln(f[1]);
end.

