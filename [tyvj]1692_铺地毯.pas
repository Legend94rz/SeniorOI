var
	i,j,n:longint;
	x,y:longint;
	xz,yz,xl,yl:array[0..10001]of longint;
begin
	readln(n);
	for i:=1 to n do
		readln(xz[i],yz[i],xl[i],yl[i]);
	readln(x,y);
	for I:=n downto 1 do
		if (x>=xz[i])and(x<=xz[i]+xl[i])and(y>=yz[i])and(y<=yz[i]+yl[i]) then
			begin
	    	    writeln(i);
				exit;
			end;
	writeln(-1);
end.

