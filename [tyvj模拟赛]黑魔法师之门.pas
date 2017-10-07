const
	p=1000000009;
var
	i,j,n,m:longint;
	s:int64;
	a,b,x,y:longint;
	f:array[0..2000001]of longint;
function getf(x:longint):longint;
var
	c,t:longint;
begin
	c:=x;
	while f[x]<>x do x:=f[x];
	while c<>x do
		begin
			t:=f[c];
			f[c]:=x;
			c:=t;
		end;
	exit(x);
end;
begin
	assign(input,'magician.in');reset(input);assign(output,'magician.out');rewrite(output);
	readln(n,m);s:=0;
	for i:=1 to n do f[i]:=i;
	for i:=1 to m do
		begin
			readln(a,b);
			x:=getf(a);y:=getf(b);
			if x<>y then
				f[x]:=y
			else
				s:=((s shl 1)mod p+1)mod p;
			writeln(s);
        end;
	close(output);
end.

