var
	i,j,n,m,k:Longint;
	fa,c,e:array[0..1241]of longint;
	f:array[0..1501,0..150]of longint;
begin
	readln(n,m);
	for I:=2 to n do read(fa[i]);
	for I:=1 to n do read(c[i]);
	for i:=1 to n do read(e[i]);
	for i:=n downto 1 do
		begin
			for j:=m downto c[i] do
				if f[i,j]<e[i] then
					f[i,j]:=e[i];
			for j:=m downto 0 do
				for k:=0 to j do
					if f[i,k]+f[fa[i],j-k]>f[fa[i],j] then
						f[fa[i],j]:=f[i,k]+f[fa[i],j-k];
        end;
	writeln(f[1,m]);
end.

