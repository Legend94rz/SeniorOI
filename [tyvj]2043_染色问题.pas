var
	i,j:longint;
	n,m,p:qword;
function md(a,b,c:qword):qword;
begin
	md:=0;
	while b>0 do
		begin
			if b and 1=1 then md:=(md+a) mod c;
			a:=(a shl 1)mod p;
			b:=b shr 1;
		end;
end;
function mi(a,b:qword):qword;
begin
	mi:=1;
	while b>0 do
		begin
			if b and 1=1 then mi:=md(mi,a,p);
            a:=md(a,a,p);
            b:=b shr 1;
		end;
end;
begin
	readln(n,m,p);
	writeln(md(m,mi(m-1,n-1),p));
end.

