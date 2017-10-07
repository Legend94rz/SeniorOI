var
	c,i,j,n,m:longint;
	a:array[0..20005]of longint;
procedure qsort(s,t:longint);
var
	i,j,k,y:longint;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1];
	repeat
		while (a[j]<k) do dec(j);
		while (a[i]>k) do inc(i);
		if i<=j then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				inc(i);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
begin
	readln(n,m);
	for i:=1 to n do
		readln(a[i]);
	qsort(1,n);
	for i:=1 to n do
		begin
			inc(c,a[i]);
			if c>=m then
				begin
					writeln(i);
					break;
				end;
		end;
end.

