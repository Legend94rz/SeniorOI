var
	i,j,n,m:longint;
	a:array[0..100001]of char;
	b:array[0..100001]of longint;
	c:array[0..400]of longint;
	l,r,ans:longint;
procedure mmod;
var
	i:Longint;
begin
	for I:=1 to l do
		r:=(r*10+b[i])mod 400;
end;
begin
	readln(n);
    for i:=0 to 400 do c[i]:=(365*(i-1)+trunc((i-1)/4)-trunc((i-1)/100)+trunc((i-1)/400)+1)mod 7;
//	writeln(c[0],' ',c[1],' ',c[2],' ',c[3],' ',c[4]);
	for i:=1 to n do
		begin
			l:=0;r:=0;
			while not eoln do
				begin
					inc(l);read(a[l]);
					b[l]:=ord(a[l])-48;
                end;
			readln;
			//for j:=1 to l do write(b[j],' ');writeln;
            mmod;
			ans:=c[r];
			writeln(ans);
		end;
end.

