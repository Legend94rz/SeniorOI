var
	x,y,i,j,n,m,key:longint;
	f:array[0..10001]of longint;
	su,nsu:longint;
function find(x:longint):longint;
var
	t,c:longint;
begin
	c:=x;
	while f[x]<>x do x:=f[x];
	while f[c]<>x do
		begin
			t:=f[c];
			f[c]:=x;
			c:=t;
		end;
	exit(x);
end;
function isp(x:longint):boolean;
var
	i:longint;
begin
	if x<2 then exit(false);
	for i:=2 to trunc(sqrt(x)) do
		if x mod i =0 then
			exit(false);
	exit(true);
end;
begin
	readln(n,m);
	for i:=1 to n do
		f[i]:=i;
	for i:=1 to m do
		begin
			readln(x,Y);
			x:=find(x);y:=find(y);
			if x<>y then
				f[x]:=y;
		end;
	readln(key);
	for i:=1 to n do
		if find(i)=find(key) then
			if isp(i) then
				inc(su)
			else
				inc(nsu);
	if su<nsu then
		writeln(su)
	else
		writeln(nsu);
end.

