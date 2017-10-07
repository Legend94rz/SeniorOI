uses
	math;
var
	i,j,n:longint;
	f:array[0..102,0..1]of double;//0 - 美元;1 - 马克;
begin
	readln(n);
	f[0,0]:=100;f[0,1]:=0;
	for i:=1 to n do
		begin
			readln(j);
			f[i,0]:=max(f[i-1,0],f[i-1,1]/j*100);
			f[i,1]:=max(f[i-1,1],f[i-1,0]/100*j);
		end;
	writeln(f[n,0]:0:2);
end.

