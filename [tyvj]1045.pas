var
	i,j,k,m,n:longint;
	s,a:array[0..1000]of longint;
	f:array[0..300,0..300]of longint;
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
begin
	readln(n,m);
	for i:=1 to n do
		begin
			read(a[i]);
			s[i]:=s[i-1]+a[i];
			f[i,0]:=s[i];
		end;
	for j:=1 to m do
		for i:=1 to n do
			for k:=j to i do
				f[i,j]:=max(f[i,j],f[k,j-1]*(s[i]-s[k]));
	writeln(f[n,m]);
end.
