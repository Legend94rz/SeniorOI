uses
	math;
var
	i,j,n,l:longint;
	a,s:array[0..2001]of longint;
	f:array[-1..2001,-1..2001]of longint;
begin
	readln(n);
	for i:=1 to n do
		begin
			readln(a[i]);
			s[i]:=s[i-1]+a[i];
			//f[i,i]:=a[i];
		end;
	{for l:=2 to n  do
		for i:=1 to n-l+1 do
			begin
				j:=i+l-1;
				f[i,j]:=max(f[i+1,j],f[i,j-1])+s[j]-s[i-1];
			end;
	writeln(F[1,N]);}
	for i:=0 to n do
		for j:=0 to n-i do
			f[i,j]:=max(f[i-1,j]+a[i]*(j+i),f[i,j-1]+a[n-j+1]*(i+j));
	for i:=0 to n do
		if f[i,n-i]>l then
			l:=f[i,n-i];
	writeln(l);
end.

