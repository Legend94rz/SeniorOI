var
	i,j,n,m,k:longint;
	v:array[0..1000]of longint;//money
	f,t:array[0..10000]of longint;//´ÎÊý
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
begin
	readLn(n,m,k);
	for i:=1 to n do
		begin
		read(t[i]);
		if m<>0 then
			if t[i] mod m <>0 then
				t[i]:=t[i] div m +1
			else
				t[i]:=t[i] div m;
		end;
	for i:=1 to n do
		read(v[i]);
	for i:=1 to n do
		for j:=k downto t[i] do
			f[j]:=max(f[j],f[j-t[i]]+v[i]);
	for i:=2 to k do
		f[1]:=max(f[1],f[i]);
	writeln(f[1]);
end.
