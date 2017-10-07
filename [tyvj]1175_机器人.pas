var
	i,j:Longint;
	a,b,t,p:int64;
function gcd(a,b:Longint):Longint;
begin
	if b=0 then exit(a);
	exit(gcd(b,a mod b));
end;
begin
	readln(a,b);
	//writeln(gcd(a,b));
	t:=gcd(a,b);
	p:=a+b;
	writeln(int64(p - t));
end.

