type
	node=record
		v,c:longint;
		end;
var
	f:array[0..1000,0..2000]of longint;
	a:array[0..3000]of node;
	i,j,n,k,v,p:longint;
begin
	readln(k,v,n);
	for i:=1 to n do
		readln(a[i].v,a[i].c);
	fillchar(f,sizeof(f),$80);f[0,0]:=0;
	for i:=1 to n do
		for j:=k downto 1 do
			for p:=v downto a[i].v do
				if f[j-1,p-a[i].v]+a[i].c>f[j,p] then
					f[j,p]:=f[j-1,p-a[i].v]+a[i].c;
	if f[k,v]<=0 then
		writeln('impossible')
	else
		writeln(f[k,v]);
end.

