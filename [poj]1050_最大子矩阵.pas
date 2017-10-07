var
	i,j,n,m,ans,t,k:longint;
	a,s:array[0..201,0..201]of longint;
	f:array[0..201]of longint;
function max(a,b,c:longint):longint;
begin
	max:=a;
	if max<b then max:=b;
	if max<c then max:=c;
end;
begin
	readln(n);m:=n;
	for i:=1 to n do
		for j:=1 to m do
			begin
				read(a[i,j]);
				s[i,j]:=s[i-1,j]+a[i,j];
			end;
	for i:=1 to n do
		for j:=1 to i do
			begin
				fillchar(f,sizeof(f),0);
				for k:=1 to m do
					begin
						f[k]:=max(f[k],0,f[k-1]+s[i,k]-s[j-1,k]);
						if f[k]>ans then ans:=f[k];
					end;
			end;
	writeln(ans);
end.

