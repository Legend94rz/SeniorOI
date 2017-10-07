var
	i,j,n,m,k,p,t:longint;
	f:array[0..101,0..101,0..101]of longint;
	s:array[0..101,0..101]of longint;
	g:array[0..3001]of longint;
	ch:char;
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
begin
	assign(input,'paint.in');reset(input);assign(output,'paint.out');rewrite(output);
	readln(n,m,t);
	for i:=1 to n do
		begin
			for j:=1 to m do begin read(ch);s[i,j]:=s[i,j-1]+ord(ch)-48;end;
			readln;
		end;
	for i:=1 to n do
		for j:=1 to m do
			for k:=1 to j do
				begin
					for p:=0 to j-1 do
						if f[i,p,k-1]+max(s[i,j]-s[i,p],j-p-s[i,j]+s[i,p])>f[i,j,k] then
							f[i,j,k]:=f[i,p,k-1]+max(s[i,j]-s[i,p],j-p-s[i,j]+s[i,p]);
                end;
	//writeln(f[3,m,1]);
	for k:=1 to n do//组数
		for j:=t downto 0 do//体积
			for i:=0 to m do//第K组的物品中的第i个
				if j>=i then
					begin
						if g[j-i]+f[k,m,i]>g[j] then
							g[j]:=g[j-i]+f[k,m,i];
					end;
	writeln(g[t]);
	close(output);
end.

