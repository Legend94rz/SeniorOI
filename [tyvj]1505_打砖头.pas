var
	f:array[-1..51,-1..51,-1..501]of longint;
	i,j,n,m,k,t,ans:longint;
	a,s:array[0..501,0..501]of longint;
begin
	readln(n,m);
	for j:=1 to n do
		for i:=n downto j do
			read(a[i,j]);
	for i:=1 to n do
		for j:=1 to i do
			s[i,j]:=s[i,j-1]+a[i,j];
	fillchar(f,sizeof(f),130);ans:=-maxlongint;
	for i:=0 to n do f[i,0,0]:=0;f[1,1,1]:=a[1,1];
	for i:=2 to n do
		for j:=0 to i do
			for k:=j to m do
				begin
					for t:=j-1 to i-1 do if f[i-1,t,k-j]+s[i,j]>f[i,j,k] then f[i,j,k]:=f[i-1,t,k-j]+s[i,j];
					if f[i,j,k]>ans then ans:=f[i,j,k];
                end;
	writeln(ans);
end.

