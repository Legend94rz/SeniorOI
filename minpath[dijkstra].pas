var
	i,j,m,n,x,y,z:longint;
	b,e:array[0..50,0..100000]of longint;
	a,d,la:array[0..100000]of longint;
        know:array[0..10000]of boolean;
procedure dijkstra(s:longint);
var
	j,i,k,min,p:longint;
begin
	fillchar(d,sizeof(d),$3f);
	d[s]:=0;
	j:=s;
	for p:=1 to n do
		begin
		know[j]:=true;{�����ȷ��}
		for i:=1 to la[j] do{��j�ڵ���һ���ɳ�}
			if d[b[j,i]]>d[j]+e[j,i] then
				d[b[j,i]]:=d[j]+e[j,i];
		j:=0;{��Ϊd[0]=$3f3f3f3f,����Ƚ�}
		for k:=1 to n do{������δȷ�����·�ĵ���ѡһ�����·������ֵ��С��}
			if not know[k] then
				if (d[k]<d[j]) then
					j:=k;{ֻ���½ڵ���}
		end;
end;
begin
	readln(n,m);
	for i:=1 to m do
		begin
		readln(x,y,z);
		inc(la[x]);
		b[x,la[x]]:=y;
		e[x,la[x]]:=z;
		end;
	dijkstra(1);
	for i:=1 to n-1 do
		write(d[i],' ');
	writeln(d[n]);
end.
