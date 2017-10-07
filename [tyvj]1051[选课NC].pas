var
	next,head,b,w:array[0..100000]of longint;
	i,j,n,m,tot,x,y,z:longint;
	f:array[0..1000,0..1000]of longint;
procedure add(x,y,z:longint);
begin
	inc(tot);
	b[tot]:=y;w[y]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
procedure treebag(s,v:longint);
var
	u,ege,i:longint;
begin
	ege:=head[s];
	while ege<>0 do
		begin
			u:=b[ege];
			for i:=1 to m do f[u,i]:=f[s,i];
			treebag(u,v-1);
			for i:=1 to v do
				f[s,i]:=max(f[s,i],f[u,i-1]+w[u]);
			ege:=next[ege];
        end;
end;
begin
	readln(n,m);
	for i:=1 to n do
		begin
			readln(y,z);
			add(y,i,z);
        end;
	treebag(0,m);
	writeln(f[0,m]);
end.

