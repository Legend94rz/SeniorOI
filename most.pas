var
	i,j,n:longint;
	a:array[0..200001]of longint;
	max:longint;
	count,p:longint;
procedure qsort(s,t:longint);
var
	k,y,i,j:longint;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1];
	repeat
		while (a[j]>k) do dec(j);
		while (a[i]<k) do inc(i);
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
	assign(input,'most.in');reset(input);assign(output,'most.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		read(a[i]);
	qsort(1,n);
	count:=1;inc(n);a[n]:=maxlongint;
	for i:=2 to n do
		if a[i]<>a[i-1] then
			begin
				if count>=max then
					begin
						p:=a[i-1];
						max:=count;
					end;
				count:=1;
			end
		else
			inc(count);
	writeln(p,' ',max);
	close(output);
end.

