var
	l,i,j,m,n:longint;
begin
	readln(n);m:=0;
	for i:=0 to  trunc((sqrt(8*n+1)-3)/2) do
		if (n-i*(i+1) shr 1)mod (i+1) =0 then inc(m);
	writeln(m);
end.
