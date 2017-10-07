var
	i,j,n,m,p,need,num,s,T,U,k:longint;
	F:array[0..1001,0..1001]of longint;
	g:array[0..1000001]of longint;
	w,v:array[0..1001]of longint;
begin
	readln(n,t,p,need,num,s);
	for i:=1 to n do
		readln(w[i],v[i]);
	fillchar(f,sizeof(f),$80);f[0,0]:=s;
	for i:=1 to t do
		for j:=0 to num do
			for k:=0 to j do
				if (f[i-1,k]+k*p-Need*(j-k)>f[i,j])and(f[i-1,k]+k*p>=Need*(j-k)) then
					f[i,j]:=f[i-1,k]+k*p-Need*(j-k);
	for I:=0 to num do if f[t,i]>U then u:=f[t,i];
	//writeln(u);
	for i:=1 to n do
		for j:=w[i] to U do
			if g[j-w[i]]+v[i]>g[j] then
				g[j]:=g[j-w[i]]+v[i];
	writeln(g[u]);
end.

