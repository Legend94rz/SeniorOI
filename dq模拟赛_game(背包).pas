var
	i,j,n,m:longint;
	a:array[0..2001]of longint;
	f:array[0..2001,0..2001]of int64;
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
begin
	assign(input,'game.in');reset(input);assign(output,'game.out');rewrite(output);
	readln(n,m);
	//if m>n then m:=n;
	for i:=1 to n do read(a[i]);
	for i:=1 to n do
		for j:=1 to min(i,m) do
			begin
				f[i,j]:=f[i-1,j];
                if f[i,j]<f[i-1,j-1]+a[i]*j then
					begin
						f[i,j]:=f[i-1,j-1]+a[i]*j;
						//writeln(i,' ',j,' ',f[i,j]);
					end;
			end;
	{for i:=1 to n do
	begin
		for j:=1 to m do
			write(f[i,j],' ');
		writeln;
end;}
	writeln(f[n,min(m,n)]);
	close(output);
end.

