var
	i,j,n,k,l:longint;
	a:array[1..1500]of longint;
	f:array[0..1500,0..1500]of longint;
begin
	readln(n);
	fillchar(f,sizeof(f),0);
	for i:=1 to n do
		read(a[i]);
	for i:=1 to n do
		f[i,i]:=a[i];
	for k:=1 to n-1 do
		for i:=1 to n-k do
			begin
			j:=i+k;
			f[i,j]:=abs(a[i]-a[j])*(j-i+1);
			for l:=i to j-1 do
				if (f[i,l]+f[l+1,j]>f[i,j])then
					f[i,j]:=f[i,l]+f[l+1,j];
			end;
	writeln(f[1,n]);
end.
