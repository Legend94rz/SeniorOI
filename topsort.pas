program TopSort;
var
　　map,link:array [1..100,1..100] of integer;
　　v,pnt:array [1..100] of integer;
　　n,m,a,b,i,j,k:integer;
begin
	fillchar(map,sizeof(map),0);
	fillchar(link,sizeof(link),0);
	fillchar(v,sizeof(v),0);
	readln(n,m);
	for i:=1 to m do
	begin
		readln(a,b);
		map[a,b]:=1;
		v[b]:=v[b]+1;
	end;
	i:=0;
	link:=map;
	while (i<n) do
	begin
		j:=1;
		while (v[j]<>0) do inc(j);
		v[j]:=-1;
		for k:=1 to n do
			if link[j,k]=1 then begin dec(v[k]);link[j,k]:=0; end;
			inc(i);
			pnt[i]:=j;
	end;
	for i:=1 to n do
	writeln(pnt[i]);
end.