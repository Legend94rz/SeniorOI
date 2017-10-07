var
	i,j,n,m,mint:longint;
	a,v,d:array[0..100000]of longint;
	b,e:array[0..50,0..100000]of longint;
	x,y,z:longint;
	know:array[0..100000]of boolean;
procedure prim(s:longint);
var
	i,j,k:longint;
begin
	fillchar(d,sizeof(d),$3f);
	j:=s;
	d[s]:=0;
	for i:=1 to n do
		begin
			know[j]:=true;
			for k:=1 to v[j] do
				if (d[b[j,k]]>e[j,k])and(not know[b[j,k]]) then
					d[b[j,k]]:=e[j,k];
			j:=0;
			for k:=1 to n do
				if not know[k] then
					if d[k]<d[j] then
						j:=k;
		end;
	mint:=0;
	for i:=1 to n do
		inc(mint,d[i]);
end;
begin
	readln(n,m);
	for i:=1 to m do
		begin
			readln(x,y,z);
			inc(v[x]);
			a[i]:=x;
			b[x,v[x]]:=y;
			e[x,v[x]]:=z;
			inc(v[y]);
			b[y,v[y]]:=x;
			e[y,v[y]]:=z;
		end;
	prim(1);
        for i:=1 to n-1 do
                write(d[i],' ');
        writeln(d[n]);
	writeln(mint);
end.
