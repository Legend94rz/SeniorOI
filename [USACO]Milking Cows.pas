{
ID:rz109291
LANG:PASCAL
PROG:milk2
}
type
	node=record
		l,r,y:longint;
		end;
var
	i,j,s,t,n:longint;
	a:array[0..6000]of longint;
	al,ar:longint;
	q:array[0..6000]of node;
	l,e,r:longint;
procedure qsort(s,t:longint);
var
	i,j,k,x:longint;
begin
	i:=s;j:=t;k:=s;
	repeat
		while (q[j].l>q[k].l) do dec(j);
		while (q[i].l<q[k].l) do inc(i);
		if (i<=j)then
			begin
			x:=q[i].l;q[i].l:=q[J].l;q[j].l:=x;
			x:=q[i].r;q[i].r:=q[j].r;q[j].r:=x;
			x:=q[i].y;q[i].y:=q[j].y;q[j].y:=x;
			inc(i);dec(j);
			end;
	until i>j;
	if i<t then qsort(i,t);
	if (s<j)then qsort(s,j);
end;
begin
	assign(input,'milk2.in');assign(output,'milk2.out');reset(input);rewrite(output);
	readln(n);l:=1;ar:=1;al:=1;
	for i:=1 to n do
		begin
			readln(q[i].l,q[i].r);q[i].y:=q[i].r-q[i].l;
		end;
	qsort(1,n);
	i:=2;
	while i<=n do
		begin
			if (q[i].l<=q[i-1].r)and(q[i].r>q[i-1].r)then
				begin
				q[i].l:=q[i-1].l;q[i].y:=q[i].r-q[i].l;
				a[ar]:=i;
				end;
			if (q[i].l>q[i-1].r) then
				begin
				inc(ar);a[ar]:=i;
				end;
			if (q[i].l>=q[i-1].l)and(q[i].r<=q[i-1].r)then
				begin
				q[i].l:=q[i-1].l;q[i].r:=q[i-1].r;
				end;
			inc(i);
		end;
	for i:=al to ar do
		if q[a[i]].y>q[1].y then q[1].y:=q[a[i]].y;
	write(q[1].y,' ');q[1].y:=0;if a[al]=0 then a[al]:=1;
	for i:=al+1 to ar do
		begin
		e:=q[a[i]].l-q[a[i-1]].r;
		if e>q[1].y then
			q[1].y:=e;
		end;
	writeln(q[1].y);
	close(input);close(output);
end.
