type
	node=record
		da:array[0..16]of longint;
		s:string[201];
		end;
var
	m,p,q,i,j,n:longint;
	a:array[0..100001]of node;
	s:string;
procedure deal(u:longint;s:string);
var
	l,i:longint;
begin
	s:=s+' ';
	l:=pos(' ',s);
	a[u].s:=copy(s,1,l-1);
	delete(s,1,l);
	for i:=1 to p do
		begin
			l:=pos(' ',s);
			val(copy(s,1,l-1),a[u].da[i]);
			delete(s,1,l);
		end;
end;
procedure qsort(s,t:Longint);
var
	k,i,j:longint;
	y:node;
begin
	i:=s;j:=t;k:=a[(t+s)shr 1].da[q];
	repeat
		while (k>a[j].da[q]) do dec(j);
		while (a[i].da[q]>k) do inc(i);
		if i<=j then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				inc(i);dec(j);
			end;
	until i>=j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
begin
	readln(n,m,p,q);
	for i:=1 to n do
		begin
			readln(s);
			deal(i,s);
		end;
	//randomize;
	qsort(1,n);
	{for i:=1 to n do
		begin
			write(a[i].s);
			for j:=1 to p do
				write(' ',a[i].da[j]);
			writeln;
		end;}
	for i:=1 to m do
		writeln(a[i].s);
end.

