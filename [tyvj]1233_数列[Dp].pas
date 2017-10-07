var
	i,j,n,m,t,ans:longint;
	a,f:array[0..20001]of longint;
begin
	readln(n);
	for i:=1 to n do read(a[i]);
	for I:=1 to n do
		if a[i]=1 then
			f[i]:=1;
	for i:=1 to n do
		begin
			for j:=0 to i-1 do
				if (f[j]+1>f[i])and(a[i]<=i)and(a[i]>a[j])and(a[i]-a[j]<=i-j)then
					f[i]:=f[j]+1;
        end;
	for i:=1 to n do
		if f[i]>ans then
			ans:=f[i];
	writeln(ans);
end.

