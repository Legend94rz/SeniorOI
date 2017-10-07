type
	node=record
		l,r,y:longint;
	end;
var
	i,j,n,l,r,ar,al,ans:longint;
	a:array[0..6000]of longint;
	q:array[0..6000]of node;
procedure qsort(s,t:longint);
var
	i,j,k:longint;
	x:node;
begin
	i:=s;j:=t;k:=s;
	repeat
		while (q[j].l>q[k].l) do dec(j);
		while (q[i].l<q[k].l) do inc(i);
		if (i<=j)then
			begin
			x:=q[i];q[i]:=q[J];q[j]:=x;
			inc(i);dec(j);
			end;
	until i>j;
	if i<t then qsort(i,t);
	if (s<j)then qsort(s,j);
end;
begin
	readln(n);
	for i:=1 to n do
		begin
		readln(q[i].l,q[i].r);
		q[i].y:=q[i].r-q[i].l;
		end;
	qsort(1,n);
	ar:=1;al:=1;//a[ar]:=1;
	i:=2;
	while i<=n do
		begin
			if (q[i].l<=q[i-1].r)and(q[i].r>q[i-1].r) then
				begin
					q[i].l:=q[i-1].l;
					q[i].y:=q[i].r-q[i].l;
					a[ar]:=i;
				end;
			if (q[i].r<=q[i-1].r) then
				begin
					q[i].l:=q[i-1].l;q[i].r:=q[i-1].r;q[i].y:=q[i-1].y;
				end;
			if (q[i].l>q[i-1].r)then
				begin
					inc(ar);a[ar]:=i;
				end;
			inc(i);
		end;
	//ans:=0;writeln(ar);
	for I:=al to ar do
		begin
			if q[a[i]].y>q[1].y then
				q[1].y:=q[a[i]].y;
			//writeln(q[a[i]].l,' ',q[a[i]].r,' ',i);
		end;
	write(q[1].y,' ');
	q[1].y:=0; if a[al]=0 then a[al]:=1;
	for i:=al+1 to ar do
		if q[a[i]].l-q[a[i-1]].r>q[1].y then
			q[1].y:=q[a[i]].l-q[a[i-1]].r;
	writeln(q[1].y);
end.
