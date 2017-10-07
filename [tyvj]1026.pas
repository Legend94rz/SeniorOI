var
	i,j,k:longint;
	a:array[0..300,0..300]of char;
	x,y,n,xi,yi,xj,yj:longint;
	count:longint;
begin
	readln(x,y,n);
	fillchar(a,sizeof(a),'*');
	for k:=1 to n do
		begin
			readln(xi,yi,xj,yj);
			for i:=xi to xj do
				for j:=yi to yj do
					a[i,j]:='#';
		end;
	for i:=1 to x do
		for j:=1 to y do
			if a[i,j]='#' then
				inc(count);
	writeLN(count);
end.
