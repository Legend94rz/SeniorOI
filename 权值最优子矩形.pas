var
	f,a:array[0..1000,0..1000]of longint;
	i,j,n,m,k:longint;
	ans,max,tot:int64;
	t:array[0..1000]of longint;
begin
	readln(n,m);
	for i:=1 to n do
		for j:=1 to m do
			begin
				read(a[i,j]);
				if a[i,j]=0 then a[i,j]:=-999999;
				f[i,j]:=f[i-1,j]+a[i,j];
			end;
	{for i:=1 to n do
		begin
			for j:=1 to m do
				write(f[i,j],' ');
			writeln;
		end;}
	for i:=1 to n do
		for j:=i to n do
			begin
				max:=0;
				ans:=-maxlongint;
				for k:=1 to m do
					begin
						max:=max+f[j,k]-f[i-1,k];
						if max>ans then
							ans:=max;
						if max<0 then max:=0;
					end;
				if ans>tot then tot:=ans;
			end;
	writelN(tot);
end.
