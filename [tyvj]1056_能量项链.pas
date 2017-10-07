var
	i,j,n,m,l,k,ans:longint;
	f:array[0..501,0..501]of longint;
	a:array[0..501]of longint;
begin
	readln(n);
	for i:=1 to n do
		begin
			read(a[i]);
			a[i+n]:=a[i];
        end;
	for l:=2 to n do
		for i:=1 to n do
			begin
				j:=i+l-1;
				for k:=i to j-1 do
					if f[i,k]+f[k+1,j]+a[i]*a[k+1]*a[j+1]>f[i,j] then
						f[i,j]:=f[i,k]+f[k+1,j]+a[i]*a[k+1]*a[j+1];
				f[i+n,j+n]:=f[i,j];
            end;
	for i:=1 to n do
		if f[i,i+n-1]>ans then
			ans:=f[i,i+n-1];
	writeln(ans);
end.

