type
	arr=array[1..2,1..2]of int64;
var
	i,j,n,m:longint;
	a,b:arr;
function cf(a,b:arr):arr;
var
	i,j,k:longint;
begin
	fillchar(cf,sizeof(cf),0);
	for i:=1 to 2 do
		for j:=1 to 2 do
			for k:=1 to 2 do
				cf[i,j]:=(cf[i,j]+a[i,k]*b[k,j])mod 20120918;
end;
function qmi(a:arr;b:longint):arr;
var
	t:longint;
begin
	qmi[1,1]:=1;qmi[1,2]:=0;
	qmi[2,1]:=0;qmi[2,2]:=1;
	while b>0 do
		begin
			if (b and 1)=1 then qmi:=cf(qmi,a);
			a:=cf(a,a);
			b:=b shr 1;
        end;
end;
begin
	assign(input,'road.in');reset(input);assign(output,'road.out');rewrite(output);
	readln(n);
	a[1,1]:=1;a[1,2]:=1;
	b[1,1]:=0;b[1,2]:=1;
	b[2,1]:=1;b[2,2]:=1;
	writeln( cf(a,qmi(b,n-1))[1,2] );
	close(output);
end.

