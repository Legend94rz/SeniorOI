var
	tot,i,j,n,m,c,xx,yy,zz:longint;
	ed,head,next,cost,w:array[0..320001]of longint;
	f:array[0..100,0..32001]of longint;
	te,tb:longint;
procedure add(x,y,z,a:longint);
begin
	inc(tot);cost[y]:=z;w[y]:=a*z;
	ed[tot]:=y;
	next[tot]:=head[x];
	head[x]:=tot;
end;
function max(a,b:longint):longint;
begin
	if A>B then exit(a);
	exit(b);
end;
procedure deal(s,v:longint);
var
	ege,j,b:longint;
begin
	ege:=head[s];
	while ege<>0 do
		begin
			b:=ed[ege];
			for j:=0 to v-cost[b] do f[b,j]:=f[s,j];
			deal(b,v-cost[b]);
			for j:=cost[b] to v do
				f[s,j]:=max(f[s,j],f[b,j-cost[b]]+w[b]);
			ege:=next[ege];
        end;
end;
begin
	readln(C,n);
	for i:=1 to n do
		begin
			readln(xx,yy,zz);//cost zy no.
			add(zz,i,xx,yy);
        end;
	{for i:=0 to n do
		begin
			te:=head[i];
			write(i);
			while te<>0 do
				begin
					tb:=ed[te];
					write('->',tb);
					te:=next[te];
                end;
			writeln;
        end;}
	deal(0,c);
	writeln(f[0,c]);
end.
