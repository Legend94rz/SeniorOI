type
	node=record
		num,da:longint;
		end;
var
	i,j,n,m,k:longint;
	a:array[0..1000000]of node;
procedure qsort(s,t:Longint);
var
	i,j,k:longint;
	y:node;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1].da;
	repeat
		while (a[j].da>k) do dec(j);
		while (a[i].da<k) do inc(i);
		if i<=j then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				dec(j);inc(i);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
begin
	readln(n);
	for i:=1 to n do
		begin
			read(a[i].da);
			a[i].num:=i;
		end;
	qsort(1,n);
	readln(k);
	writeln(a[k].num);
end.

