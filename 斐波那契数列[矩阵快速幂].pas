type
	jz=array[0..2,0..2]of int64;
var
	n:longint;
	a,b,c,f:jz;
function cf(x,y:jz):jz;
var
	j,k,i:longint;
begin
	fillchar(c,sizeof (c),0);
	for i:=1 to 2 do
		for j:=1 to 2 do
			for k:=1 to 2 do
				c[i,j]:=(c[i,j]+x[i,k]*y[k,j]) mod 123456;
	exit(c);
end;
function qm(x:jz;y:int64):jz;
begin
	qm[1,1]:=1;qm[1,2]:=0;
	qm[2,1]:=0;qm[2,2]:=1;
	while y>0 do
		begin
			if (y and 1) = 1 then qm:=cf(qm,x);
			x:=cf(x,x);
			y:=y shr 1;
		end;
	exit(qm);
end;
begin
	a[1,1]:=1;a[1,2]:=1;
	b[1,1]:=0;b[1,2]:=1;
	b[2,1]:=1;b[2,2]:=1;
	readln(n);
	writeln(   cf(a,qm(b,n-1))[1,2]    );
end.