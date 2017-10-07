VAR
	i,j,m,sumv:longint;
	n:double;
	p,f:array[0..20001]of double;
	v:array[0..20001]of longint;
begin
	readln(n);
	readln(m);
	for i:=1 to m do begin readln(p[i],v[i]);inc(sumv,v[i]);end;
	for i:=1 to sumv do f[i]:=999999999;f[0]:=0;
    for i:=1 to m do
		for j:=sumv downto v[i] do
			if f[j-v[i]]+p[i]<f[j] then
				f[j]:=f[j-v[i]]+p[i];
	//for i:=1 to sumv do writeln('>>',i,' ',f[i]:0:3);
	for i:=sumv downto 1 do
		if f[i]<=n then begin
			writeln(i);
			break;
		end;
end.

