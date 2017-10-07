type
	node=record
		da:Longint;
		tp:byte;
                end;
var
	i,j,n,m:longint;
	a:array[0..4000004]of node;
	ans:int64;
	count:array[1..2]of longint;
procedure qsort(s,t:longint);
var
	i,j,k:longint;
	y:node;
begin
	i:=s;j:=t;k:=a[(s+t) shr 1].da;
	repeat
		while (a[j].da<k) do dec(j);
		while (a[i].da>k) do inc(i);
		if i<=j then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				inc(I);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
begin
	readln(n,m);
	for i:=1 to n-1 do
		begin
			read(a[i].da);
			a[i].tp:=1;
		end;
	for i:=n to n+m-2 do
		begin
			read(a[i].da);
			a[i].tp:=2;
		end;
	qsort(1,n+m-2);
	for i:=1 to n+m-2 do
		begin
			inc(count[a[i].tp]);
			inc(ans,a[i].da*(count[3-a[i].tp]+1));
		end;
	writeln(ans);
end.

