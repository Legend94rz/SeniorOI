{
var
	i,j:longint;
	m:int64;
	x,y,xm,ym,n,maxk:int64;
begin
	readln(n,m);
	xm:=0;ym:=1;maxk:=0;
	for I:=1 to n do
		begin
			readln(x,y);
			if y<=m then
				if int64(xm*y)<int64(x*ym) then begin
					xm:=x;ym:=y;maxk:=i;
				end;
        end;
	writeln(maxk);
end.
}
var
	i,j,n:longint;
	m:int64;
	x,y,xm,ym,maxk,max:extended;
begin
	readln(n,m);
	for I:=1 to n do
		begin
			readln(x,y);
			if y<=m then
				if x/y>max then begin
					max:=x/y;maxk:=i;
				end;
        end;
	writeln(maxk:0:0);
end.
