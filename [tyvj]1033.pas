program ty1033;
type
	node=record
		da,dp:longint;
		End;
var
	i,j,n,p,tot:longint;
	c,d1,d2:longint;
	next,head,ed:array[0..300000]of longint;
	q:array[0..200000]of node;
	l,r:longint;
procedure add(x,y:longint);
begin
	if (x=0)or(y=0) then exit;
	inc(tot);
	ed[tot]:=y;next[tot]:=head[x];
	head[x]:=tot;
end;
procedure bfs;
var
	ege,b:longint;
	k:node;
begin
	l:=0;r:=1;q[1].da:=1;q[1].dp:=1;
	repeat
		inc(l);
		k:=q[l];
		ege:=head[k.da];
		while ege<>0 do
			begin
				b:=ed[ege];
				inc(r);
				q[r].da:=b;
				q[r].dp:=q[l].dp+1;
				ege:=next[ege];
			End;
	Until l>=r;
	writeln(q[r].dp);
end;
begin
	readln(n);
	for i:=1 to n-1 do
		begin
			readln(c,d1,d2);
			add(c,d1);add(c,d2);
		end;
	bfs;
end.
