var
	i,j,n,m:longint;
	f:array[0..100,0..100]of int64;
begin
	readln(n,m);
	f[0,1]:=1;
	for i:=1 to m do
		begin
			f[i,1]:=f[i-1,2]+f[i-1,n];
			for j:=2 to n-1 do
				f[i,j]:=(f[i-1,j+1]+f[i-1,j-1]);
			f[i,n]:=f[i-1,n-1]+f[i-1,1];
		end;
	writeln(f[m,1]);
end.

