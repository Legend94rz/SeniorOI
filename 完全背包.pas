var
	f:array[0..5000]of longint;
	i,j,v:longint;
	a:array[0..5000]of longint;
begin
	for i:=1to 10 do
		read(a[i]);
	readln(v);
        for I:=1 to 100 do
                f[i]:=100000;
        for i:=1 to 10 do
		for j:=i to v do
			if f[j-i]+a[i]<f[j] then
				f[j]:=f[j-i]+a[i];
	writeln(f[v]);
end.
