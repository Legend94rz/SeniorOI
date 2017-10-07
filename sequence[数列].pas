var
	i,j,n:Longint;
	a:array[0..2000]of longint;
	f:array[0..1001,-1..1001]of longint;
	t:longint;
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
begin
	assign(input,'sequence.in');reset(input);assign(output,'sequence.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		read(a[i]);
	for i:=1 to n do
		for j:=0 to n do
			if a[i]=i-j then
				f[i,j]:=f[i-1,j]+1
			else
				f[i,j]:=max(f[i-1,j],f[i-1,j-1]);
	for i:=0 to n do
		if f[n,i]>t then
			t:=f[n,i];
	writeln(t);
	close(input);close(output);
end.

