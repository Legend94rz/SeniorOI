const p=1234567;
var
	n:int64;
function quickmi(a,b:int64):longint;
var
	s:int64;
begin
	s:=1;
	while b>0 do
		begin
			if (b and 1=1) then s:=(s*a)mod p;
			a:=((a)*(a))mod p;
			b:=b shr 1;
        end;
	exit(s mod p);
end;
begin
	readln(n);
	writeln(quickmi(2,n-1));
end.

