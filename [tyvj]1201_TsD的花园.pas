Const P=11129;
var
	i,j:Longint;
	N,M,Sort:int64;
	ans:int64;
function mi(a,b:Longint):longint;
begin
	mi:=1;a:=a mod P;
	while b>0 do
		begin
			if b and 1=1 then mi:=(mi*a)mod P;
			b:=b shr 1;
			a:=a*a mod P;
		end;
end;
begin
	readln(N,M,Sort);
	case Sort of
		0:writeln( (m mod P)*mi(m-1,n-1) mod P);
		1:begin
			writeln((mi(m-1,n)+mi(-1,n)*(m-1))mod p  );
		end;
		2:begin
			ans:=mi(m-2,n-1)+mi(-1,n-1)*(m-2);
			if ans<0 then ans:=ans+p;
            ans:=m*(ans mod P)mod P;
			writeln( ans );
        end;
	end;
end.

