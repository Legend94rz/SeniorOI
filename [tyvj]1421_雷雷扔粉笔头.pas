var
	i,n:longint;
	f:array[0..1,0..101]of qword;
begin
	readln(n);
	f[0,0]:=1;f[1,0]:=0;
	for i:=1 to n do
		begin
			f[0,i]:=f[0,i-1]+f[1,i-1];
			f[1,i]:=f[0,i-1];
		end;
	f[0,0]:=f[0,n]+f[1,n];
	writeln(f[0,0]);
end.

