var
	i,j,n:longint;
	ans:int64;
	a,b:array[0..100001]of int64;
	f:array[-1..500001]of int64;
begin
//	assign(input,'1.in');reset(input);
	readln(n);
	for i:=1 to n do read(a[i]);
	for i:=1 to n do read(b[i]);
	for i:=1 to n do
		begin
        	f[i]:=f[i-1];
			for j:=1 to i-1 do
				begin
					if f[j-1]+a[j]*b[i]>f[i] then
						f[i]:=f[j-1]+a[j]*b[i];
				end;
		end;
	for i:=1 to n do
		if f[i]>ans then ans:=f[i];
	writeln(ans);
end.

