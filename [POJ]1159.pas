var
	i,j,n,m:longint;
	a:array[0..5005]of char;
	f:array[0..1,0..5005]of longint;
function max(a,b:longint):Longint;
begin
	if a>b then exit(a);
	exit(b);
end;
begin
	readln(n);
	for i:=1 to n do
		read(a[i]);
	for i:=1 to n do
		for j:=n downto 1 do
			begin
				if a[i]=a[j] then
					f[i and 1,n-j+1]:=f[(i-1)and 1,n-j]+1
				else
					f[i and 1,n-j+1]:=max(f[(i-1)and 1,n-j+1],f[i and 1,n-j]);
				if f[i and 1,n-j+1]>m then m:=f[i and 1,n-j+1];
			end;
	writeln(n-m);
end.
