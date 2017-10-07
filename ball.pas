var
	f:array[0..200,0..200]of longint;
	i,j,n,m:longint;
begin
	readLN(n,m);
	f[1,2]:=1;f[1,n]:=1;
	for I:=2 to m do
		for j:=1 to n do
			begin
			if(j=1)then
				f[i,1]:=f[i-1,n]+f[i-1,2];
			if(j=n)then
				f[i,n]:=f[i-1,1]+f[i-1,n-1];
			if(j<>n)and(j<>1)then
				f[i,j]:=f[i-1,j-1]+f[i-1,j+1];
			end;
	writelN(f[m,1]);
end.