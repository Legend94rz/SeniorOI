var
	i,j:longint;
	n,v:longint;
	f:array[0..10000]of longint;
	val,w:array[0..1000]of longint;
begin
	readln(v,n);
	for i:=1 to n do
		readln(w[i],val[i]);
	fillchar(f,sizeof(f),0);
	for i:=1 to n do
		for j:=v downto w[i] do
			if f[j-w[i]]+val[i]>f[j] then
				f[j]:=f[j-w[i]]+val[i];
	writeln(f[v]);
end.
