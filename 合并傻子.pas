var
	a,sum:array[-1..3000]of longint;
	f:array[0..700,0..700]of longint;
	i,j,l,k,n,min,p:longint;
begin
	readlN(n);
	for i:=1 to n do
		begin
			read(a[i]);
			a[i+n]:=a[i];
			sum[i]:=sum[i-1]+a[i];
		end;
	for i:=0 to n+1 do
		for J:=0 to n+1 do
			f[i,j]:=maxlongint;
	for I:=1 to n do
		f[i,1]:=0;
	for i:=2 to n do
		for j:=1 to n do
			if (j+i-1<=n) then
				for k:=1 to i-1 do
					if f[j,i]>f[j,k]+f[j+k,i-k]+sum[j+i-1]-sum[j-1] then
						f[j,i]:=f[j,k]+f[j+k,i-k]+sum[j+i-1]-sum[j-1];
	writeln(f[1,n]);
end.
