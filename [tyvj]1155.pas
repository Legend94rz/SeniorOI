type
	jz=array[1..2,1..2]of extended;

var
	n,f1,f0:longint;
	a,b:extended;
	aa,ab,ac:jz;
function cf(x,y:jz):jz;
var
	i,j,k:longint;
begin
	fillchar(ac,sizeof(ac),0);
	for i:=1 to 2 do
		for j:=1 to 2 do
			for k:=1 to 2 do
				ac[i,j]:=ac[i,j]+x[i,k]*y[k,j];
	exit(ac);
end;
function qm(x:jz;y:longint):jz;
begin
	qm[1,1]:=1;qm[1,2]:=0;
	qm[2,1]:=0;qm[2,2]:=1;
	while y>0 do
		begin
		if (y and 1)=1 then qm:=cf(qm,x);
		x:=cf(x,x);
		y:=y shr 1;	
		end;
	exit(qm);
end;
begin
	readln(f0,f1,a,b,n);
	aa[1,1]:=f0;aa[1,2]:=f1;
	ab[1,1]:=0;ab[1,2]:=b;
	ab[2,1]:=1;ab[2,2]:=a;
	ab:=qm(ab,n);
	aa:=cf(aa,ab);
	writeln(round(aa[1,1]));
end.
