type
	arr=array[0..10001]of longint;
var
	i,j,n,m:longint;
	a,b:arr;
	ans:longint;
procedure qsort(var a:arr;s,t:longint);
var
	i,j,k,y:longint;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1];
	repeat
		while a[j]>k do dec(j);
		while a[i]<k do inc(i);
		if i<=j then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				inc(i);dec(J);
			end;
	until i>j;
	if (s<j) then qsort(a,s,j);
	if (i<t) then qsort(a,i,t);
end;
begin
	readln(n);
	for i:=1 to n do
		read(a[i]);
	for i:=1 to n do
		read(b[i]);
	qsort(a,1,n);qsort(b,1,n);
	for I:=1 to n do
		inc(ans,abs(a[i]-b[n-i+1]));
	writeln(ans);
end.
