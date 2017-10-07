var
	i,j,n,m,fz,fm,s,k:longint;
begin
	readLN(k);
	for i:=1 to k do
		if (1+i)*i>=2*k then
			begin
				n:=i;
				break;
			end;
	s:=(n-1)*n div 2;
	if not odd(n) then
		begin
		fz:=k-s;
		fm:=n+1-fz;
		end
	else
		begin
			fm:=k-s;
			fz:=n+1-fm;
		end;
	writeln(fz,'/',fm);
end.
