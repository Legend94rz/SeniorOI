type
	node=record
		da,no:longint;
		end;
var
	q1,q2:array[-1..2000001]of node;
	a,al,ah:array[0..2000001]of longint;
	l1,r1,l2,r2,k,n,i:longint;
procedure inq(no:longint);
var
	t:longint;
begin
	t:=a[no];
	while (q1[r1].da>=t)and(r1>=l1) do dec(r1);inc(r1);q1[r1].da:=t;q1[r1].no:=no;
	while (q2[r2].da<=t)and(r2>=l2) do dec(r2);inc(r2);q2[r2].da:=t;q2[r2].no:=no;
	while (q1[l1].no<no-k+1) do inc(l1);
	while (q2[l2].no<no-k+1) do inc(l2);
end;
begin
	readln(n,k);
	for i:=1 to n do read(a[i]);
	for i:=1 to k do inq(i);al[1]:=q1[l1].da;ah[1]:=q2[l2].da;
	for i:=k+1 to n do
		begin
			inq(i);
			al[i-k+1]:=q1[l1].da;
			ah[i-k+1]:=q2[l2].da;
        end;
	for i:=1 to n-k do write(al[i],' ');writeln(al[n-k+1]);
	for i:=1 to n-k do write(ah[i],' ');writeln(ah[n-k+1]);
end.

