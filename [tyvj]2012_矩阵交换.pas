var
	i,j,n,m,t,k:longint;
	a:array[0..701,0..701]of longint;
	f,g:array[0..701]of longint;
	ch:char;
begin
	readln(n,m);
	for i:=1 to n do
		for j:=1 to n do
			read(a[i,j]);
	readln;
	for i:=1 to n do
		begin
			f[i]:=i;//行
			g[i]:=i;//列
		end;
	for k:=1 to m do
		begin
			read(ch);
			readln(i,j);
			case ch of
				'R':begin t:=f[i];f[i]:=f[j];f[j]:=t; end;
				'C':begin t:=g[i];g[i]:=g[j];g[j]:=t; end;
				'A':begin writeln(a[f[i],g[j]]);end;
			end;
        end;
end.

