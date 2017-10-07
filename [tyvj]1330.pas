var
	i,j,a,z:longint;
	n,x,y:int64;
begin
	readln(n);
        y:=trunc(sqrt(n));
	{for i:=1 to n do
		if sqrt(i*n)-trunc(sqrt(i*n))<=0.00000001 then
		begin
		writeln(n+2*trunc(sqrt(i*n)) + i);
		break;
		end;}
	for i:=y+1 downto 1 do
		if n mod (i*i) =0 then
			begin
                        z:=i*i;
			writeln(n+2*trunc(sqrt((n*n) div (i*i)))+n div z);
			break;
			end;
		
end.
