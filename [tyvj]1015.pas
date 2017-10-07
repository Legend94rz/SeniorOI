var
	i,j,n,m:longint;
	f:array[0..100000]of longint;
	a,w:array[0..100]of longint;
begin
	for i:=1 to 10 do
		begin
			read(a[i]);
			w[i]:=i;
		end;
	readln(m);fillchar(f,sizeof(f),$3f);f[0]:=0;
	for i:=1 to 10 do
		for j:=w[i] to m do
			if f[j-w[i]]+a[i]<f[j] then
				f[j]:=f[j-w[i]]+a[i];
	writeln(f[m]);
end.

