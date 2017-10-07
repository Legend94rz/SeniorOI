var
	q,a,v,color,f:array[1..4000]of longint;
	i,n,m,l,r,x,y,z:longint;
	b,e:array[0..50,0..10000]of longint;
	d:boolean;
	ct:-1..1;
procedure bfs;
var
	i,j,k:longint;
begin
	repeat
		inc(l);
		k:=q[l];
		ct:=1-color[k];
		for i:=1 to v[k] do
			if color[b[k,i]]=-1 then
				begin
				color[b[k,i]]:=ct;
				inc(r);
				q[r]:=b[k,i];
				end
			else
				if color[b[k,i]]=ct then
					continue
				else
					begin
					d:=false;
					exit;
					end;
	until l>=r;
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
	d:=true;
	for i:=1 to n do
		color[i]:=-1;
	l:=0;r:=1;
	q[r]:=1;
	ct:=1;
	bfs;
	writeln(d);
end.
