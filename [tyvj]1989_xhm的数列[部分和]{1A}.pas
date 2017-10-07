var
	i,j,n,q1,q2,l,r:longint;
	t:int64;
	s,a:array[0..1000001]of int64;
begin
	readln(n,q1,q2);
	for i:=1 to n do begin read(s[i]);a[i]:=s[i]-s[i-1];end;
	for i:=1 to q1 do
		begin
			readln(l,r,t);
			a[l]:=a[l]+t;a[r+1]:=a[r+1]-t;
        end;
	for i:=1 to n do s[i]:=s[i-1]+a[i];
	for i:=1 to q2 do
		begin
			readln(t);
			writeln(s[t]);
        end;
end.

