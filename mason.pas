type
	arr=array[1..1000]of longint;
var
	a,b:arr;
	m,i,j,g,k:longint;
function gao(a,b:arr):arr;
var
	c:arr;
	i,j:integer;
begin
	for i:=1to 500 do c[i]:=0;
	for i:=1 to 500 do
                for J:=1 to 500 do
			c[i+j-1]:=c[i+j-1]+a[j]*b[i];
	for i:=1 to 499 do
		begin
		c[i+1]:=c[i+1]+c[i] div 10;
		c[i]:=c[i] mod 10;
		end;
	c[500]:=c[500] mod 10;
        exit(c);
end;
begin
	readlN(m);
	a[1]:=1;b[1]:=2;
	K:=m;
	while k>0 do
		begin
			if(k and 1 = 1)then a:=gao(a,b);
			b:=gao(b,b);
			k:=k shr 1;
		end;
	writeln(trunc( m*ln(2)/ln(10) )+1);
	if(a[1]=0)then begin dec(a[2]);a[1]:=9;end else dec(a[1]);
        k:=0;
	for i:=500 downto 1 do
		begin
		write(a[i]);inc(k);
                if(k mod 50=0)then
			writeln;
		end;
end.
