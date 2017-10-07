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
		know[j]:=true;{标记已确定}
		for i:=1 to la[j] do{以j节点做一次松弛}
			if d[b[j,i]]>d[j]+e[j,i] then
				d[b[j,i]]:=d[j]+e[j,i];
		j:=0;{因为d[0]=$3f3f3f3f,方便比较}
		for k:=1 to n do{在所有未确定最短路的点中选一个最短路径估计值最小的}
			if not know[k] then
				if (d[k]<d[j]) then
					j:=k;{只记下节点编号}
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
