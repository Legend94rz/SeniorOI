var
	t,i,j,n,m:longint;
	a,b,f:array[0..4001]of longint;
begin
	readln(n);
	for i:=1 to n do read(a[i]);
	for I:=1 to n do read(b[i]);
	for i:=1 to n do
		begin
			t:=0;
			for j:=1 to n do
				begin
					if (a[i]=b[j])and(t+1>f[j]) then f[j]:=t+1;
					if (a[i]>b[j])and(t<f[j]) then t:=f[j];
				end;
        end;
	t:=0;
	for I:=1 to n do if f[i]>t then t:=f[i];
	writeln(t);
end.


