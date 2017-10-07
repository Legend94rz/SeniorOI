var
	a:array[0..2000]of longint;
	i,j,n:longint;
	s:int64;
begin
	readln(n);
	a[1]:=1;
	for i:=1 to n div 2 do
		begin
			a[i]:=1;
			for j:=1 to i div 2 do
				inc(a[i],a[j]);
		end;
	s:=0;
	for i:=1 to n div 2 do
		inc(s,a[i]);
	writeln(s+1);
end.
