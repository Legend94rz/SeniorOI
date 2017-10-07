var
	i,j:longint;
	n:longint;
	a,f:array[0..100009]of longint;
	ans:int64;
procedure qsort(s,t:longint);
var
	i,j,k,y:longint;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1];
	repeat
		while a[j]>k do dec(j);
		while a[i]<k do inc(i);
		if i<=j then begin
			y:=a[j];a[j]:=a[i];a[i]:=y;
			inc(i);dec(j);
		end;
	until i>=j;
	if (i<t) then qsort(i,t);
	if (s<j) then qsort(s,j);
end;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
begin
	assign(input,'river.in');reset(input);//assign(output,'river.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		readln(a[i]);
	qsort(1,n);
	i:=2;
	f[1]:=a[1];f[2]:=a[2];
	for i:=3 to n do
		f[i]:=min(f[i-1]+a[1]+a[i],f[i-2]+a[i]+a[1]+a[2]*2);
	writeln(f[n]);
	close(input);close(output);
end.
