var
	i,j,n,m,ans:longint;
	a:array[0..100001]of char;
begin
	readln(n,m);j:=1;
	for i:=1 to n do read(a[i]);readln;
	if m>2 then
		begin
			for i:=2 to n+1 do
				if a[i]=a[i-1] then
					inc(j)
				else
					begin
						inc(ans,j shr 1);j:=1;
					end;
		end;
	if m=2 then
		begin
			for i:=2 to n+1 do
				if a[i]=a[i-1] then
					inc(j)
				else
					begin
						if j>2 then inc(ans,j shr 1) else inc(ans,j shr 1+1);j:=1;
					end;
		end;
	writeln(ans);
end.

