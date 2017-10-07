var
	i,j,n,m,ans,p:longint;
	ch:char;
	f,a:array[-5..200,-5..200]of longint;
begin
	readln(n,m);
	for i:=1 to n do
		begin
			for j:=1 to m do
				begin
					read(ch);
					if ch='1' then a[i,j]:=1;
				end;
			readln;
		end;
	i:=n-1;
	while i>=1 do
		begin
			for j:=1 to m do
				begin
					f[i,j]:=f[i+2,j]+a[i+1,j];
					if (j-1>=1)and(f[i,j]>f[i+2,j-1]) then
						f[i,j]:=f[i+2,j-1];
					if (j+1<=m)and(f[i,j]>f[i+2,j+1]) then
						f[i,j]:=f[i+2,j+1];
					f[i,j]:=f[i,j]+a[i,j];				
				end;
			dec(i,2);
		end;
        p:=i+2;{writeln('p:',p);
	for I:=1 to n do
		begin
		for j:=1 to m do
			write(f[i,j]);
		writeln;
		end; }
	ans:=maxlongint;
	for j:=1 to m do
		if f[p,j]<ans then
			ans:=f[p,j];
	writeln(ans);
end.
