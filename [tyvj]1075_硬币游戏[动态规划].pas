var
	i,j,n:longint;
	s,a:array[0..2001]of longint;
	f:array[0..2001,0..2001]of longint;
function max(a,b:longint):longint;
begin
	if (a>b) then exit(a);
	exit(b);
end;
begin
	readln(n);
	for i:=n downto 1 do readln(a[i]);
	for i:=1 to n do s[i]:=s[i-1]+a[i];
	for i:=1 to n do
		for j:=1 to n do
            begin
				f[i,j]:=f[i,j-1];
				if i-2*j+1>=0 then f[i,j]:=max(f[i,j],s[i]-f[i-(2*j-1),2*j-1]);
				if i-2*j>=0 then f[i,j]:=max(f[i,j],s[i]-f[i-2*j,2*j]);
				//f[i,j]:=max(f[i,j-1],max(s[i]-f[i-(2*j-1),2*j-1],s[i]-f[i-2*j,2*j]) );
			end;
	writeln(f[n,1])
end.

