var
	i,j,n,m,p:longint;
	f:array[0..10000]of longint;
	x,y:longint;
function find(x:Longint):longint;
var
	t,c:longint;
begin
	c:=x;
	while x<>f[x] do x:=f[x];
	while f[c]<>x do
		begin
			t:=f[c];
			f[c]:=x;
			c:=t;
		end;
	exit(x);
end;
begin
	readln(n,m,p);
	for i:=1 to n do
		f[i]:=i;
	for i:=1 to m do
		begin
			readln(x,y);
			x:=find(x);y:=find(y);
			f[x]:=y;
		end;
	for i:=1 to p do
		begin
			readln (x,y);
			x:=find(x);y:=find(y);
			if x<>y then
				writeln('No')
			else
				writeln('Yes');
		end;
end.

