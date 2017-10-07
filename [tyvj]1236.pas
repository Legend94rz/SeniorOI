var
	m,i,j,n:longint;
	ans:longint;
begin
	readln(n);
	for i:=1 to n do
		begin
			m:=trunc(ln(i)/ln(2))+1;
			for j:=2 to m do
				if (i shr (j-1)and 1=1)and(i shr (j-2)and 1=1) then
					inc(ans);
		end;
	writeln(ans);
end.

