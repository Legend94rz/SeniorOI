var
	i,j,n,m,ans:Longint;
	a,d:array[0..1001,0..1001]of longint;
function min(a,b,c:longint):longint;
begin
	min:=a;
	if min>b then min:=b;
	if min>c then min:=c;
end;
begin
	readln(n,m);
	for i:=1 to n do
		for j:=1 to m do
			read(a[i,j]);
	for I:=1 to n do
		for j:=1 to m do
			if a[i,j]=1 then
				begin
					d[i,j]:=min(d[i-1,j-1],d[i-1,j],d[i,j-1])+1;
					if d[i,j]>ans then ans :=d[i,j];
				end;
	writeln(ans);
end.

