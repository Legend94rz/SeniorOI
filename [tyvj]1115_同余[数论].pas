var
	i,j,n:longint;
	a:array[0..200]of longint;
	ans:longint;
function gcd(a,b:longint):longint;
begin
	if b=0 then exit(a);
	exit(gcd(b,a mod b));
end;
begin
	readln(n);
	for i:=1 to n do read(a[i]);
    ans:=abs(a[1]-a[2]);
	for i:=2 to n do ans:=gcd(ans,abs(a[i]-a[1]));
	writeln(ans);
end.

