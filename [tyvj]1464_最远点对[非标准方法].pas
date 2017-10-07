var
	i,j,n,m,t:longint;
	x,y,z:int64;
	a:array[0..150001,1..2]of int64;
begin
	readln(n);
	for i:=1 to n do readln(a[i,1],a[i,2]);
	x:=0;
	for i:=1 to n do
		begin
			y:=sqr(a[i,1]-a[1,1])+sqr(a[i,2]-a[1,2]);
			if y>x then
				begin
					z:=i;
					x:=y;
				end;
		end;
    x:=0;
	for i:=1 to n do
		begin
			y:=sqr(a[i,1]-a[z,1])+sqr(a[i,2]-a[z,2]);
			if y>x then x:=y;
        end;
	writeln(x);
end.

