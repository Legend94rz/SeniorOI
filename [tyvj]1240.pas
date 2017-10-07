program ty1240;
var
	done:array[0..1000]of boolean;
	a:array[0..1000]of longint;
	i,j,n,k,s,r:Longint;
begin
	readln(n,k);
	for i:=1 to n do
		read(a[i]);
	s:=n div k;r:=n mod k;
	if r<>0 then
		inc(s);
	for i:=1 to s do
		begin
			j:=i;
			while j<=n do
				begin
					write(a[j]:4);
					inc(j,s);
				end;
			writeln;
		end
end.
