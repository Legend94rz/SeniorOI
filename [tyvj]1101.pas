var
	a:array[0..10001]of ansistring;
	i,j,n:longint;
procedure qsort(s,t:longint);
var
	i,j:longint;
	k,y:ansistring;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1];
	repeat
		while (a[j]>k) do dec(j);
		while (a[i]<k) do Inc(i);
		if (i<=j) then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				inc(I);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
begin
	readln(n);
	for i:=1 to n do
		readlN(a[i]);
	qsort(1,n);
	for i:=1 to n do
		writeln(a[i]);
end.

