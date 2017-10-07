program ty1023;
uses
	math;
var
	k,i,j,n,m:longint;
	d:array[0..10000]of longint;
	f:array[0..2001,0..501]of longint;
begin
	readln(n,m);
	for i:=1 to n do
		readln(d[i]);
	for i:=1 to n do
		for j:=0 to m do
			begin
				f[i,0]:=max(f[i-1,0],f[i,0]);
				for k:=1 to min(m,i) do
					if f[i-k,k]>f[i,0] then
						f[i,0]:=f[i-k,k];
				if j>=1 then f[i,j]:=max(f[i-1,j-1]+d[i],f[i,j]);
			End;
	writeln(f[n,0]);
end.

