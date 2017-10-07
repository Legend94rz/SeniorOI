type
	node=record
		l,r:longint;
		end;
var
	i,j,n,m,ans:longint;
	l,r:Longint;
	a:array[0..10001]of node;
	q:array[0..10001]of node;
procedure qsort(s,t:longint);
var
	k,i,j:longint;
	y:node;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1].l;
	repeat
		while (a[j].l>k) do dec(j);
		while (a[i].l<k) do inc(i);
		if i<=j then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				inc(i);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
function check(x,y:longint):byte;
begin
	if (x>=q[r].l)and(x<=q[r].r)and(y>q[r].r) then exit(1);
	if (x>=q[r].l)and(y<=q[r].r) then exit(3);
	if (x>q[r].r) then exit(2);
	exit(3);
end;
begin
	assign(input,'tree.in');reset(input);assign(output,'tree.out');rewrite(output);
	readln(n,m);
	for i:=1 to m do
		readln(a[i].l,a[i].r);
	qsort(1,m);
	inc(r);q[r].l:=a[1].l;q[r].r:=a[1].r;
	for i:=2 to m do
		case check(a[i].l,a[i].r) of
			1:begin q[r].r:=a[i].r;end;
			2:begin inc(r);q[r].l:=a[i].l;q[r].r:=a[i].r;end;
			end;
	for i:=1 to r do
		inc(ans,q[i].r-q[i].l+1);
	writeln(n+1-ans);
	close(output);
end.
