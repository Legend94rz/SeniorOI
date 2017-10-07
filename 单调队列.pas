type
	node=record
		i,k:longint;
		end;
var
	i,j,n,m,no,k:longint;
	ch:char;
	q:array[0..100001]of node;
	l,r:longint;
procedure insert1(no,k:longint);
var
	i:longint;
begin
	while (r>=l)and(k>=q[l].k) do dec(r);inc(r);q[r].k:=k;q[r].i:=no;
end;
procedure delete1(i:longint);
begin
	if q[l].i=i then inc(l);
end;
procedure get(var no,k:longint);
begin
	no:=q[l].i;k:=q[l].k;
end;
begin
	readln(n);
	for i:=1 to n do
		begin
		    read(ch);
			case ch of
				'I':begin readln(k);insert1(i,k);end;
				'D':begin readln;	delete1(i);end;
				'Q':begin readln;	get(no,k);writeln(k,' ',NO);end;
			end;
		end;
end.

