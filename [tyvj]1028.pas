program ty1028;
var
	f:array[0..45000]of boolean;
	n,v:longint;
	a:array[0..1000]of longint;
	i,j:longint;
begin
	readln(v,n);
	for i:=1 to n do
		readln(a[i]);
	f[0]:=true;
	for i:=1 to n do
		for j:=v downto a[i] do
			if f[j-a[i]] then
				f[j]:=true;
	for i:=v downto 0 do
		if f[i] then
			begin
				writeln(i);
				break;
			End;
end.
