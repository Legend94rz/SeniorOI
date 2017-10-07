var
	f:array[0..300,0..300]of longint;
	a:array[1..500]of longint;
	i,j,k,l,n:longint;
begin
	readln(n);
	for i:=1 to n do
		read(a[i]);
	for i:=1 to n do
		f[i,i]:=a[i];
	for l:=2 to n do
		for i:=1 to n-1 do
			begin
			j:=l+i-1;
			f[i,j]:=abs(a[i]-a[j])*(j-i+1);
			for k:=i to j-1 do
				if(f[i,k]+f[k+1,j]>f[i,j])then
					f[i,j]:=f[i,k]+f[k+1,j];			
			end;
	writeln(f[1,n]);
end.
