var
	i,j,n,m:longint;
	Beginlevel,Maxlevel:longint;
	f:array[0..50,0..50001]of boolean;
	c:array[0..50001]of longint;
begin
	assign(input,'changingsounds.in');reset(input);assign(output,'changingsounds.out');rewrite(output);
	readln(n,Beginlevel,MaxLevel);
	for I:=1 to n do
		read(c[i]);
	f[0,Beginlevel]:=true;
	if beginlevel>=c[1] then f[1,beginlevel-c[1]]:=true;
	if beginlevel+c[1]<=maxlevel then f[1,beginlevel+c[1]]:=true;
	for i:=2 to n do
		begin
			for j:=maxlevel downto 0 do
				begin
					if j>=c[i] then if f[i-1,j-c[i]] then f[i,j]:=true;
					if j+c[i]<=maxlevel then if f[i-1,j+c[i]] then f[i,j]:=true;
				end;
		end;
	for i:=maxlevel downto 0 do
		if f[n,i] then begin writeln(i);close(output);exit;end;
	writeln(-1);
	close(output);
end.

