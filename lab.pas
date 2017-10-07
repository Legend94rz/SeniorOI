type
	node=record
		rec:array[0..20]of longint;
		no:longint;
		name:string;
		sum:longint;
		end;
var
	i,j,n:longint;
	a:array[0..10005]of node;
	s:string;
operator > (a,b:node)ans:boolean;
begin
	if a.sum<b.sum then exit(true);
	if (a.sum=b.sum)and(a.no<b.no) then exit(true);
	exit(false);
end;
operator < (a,b:node)ans:boolean;
begin
	if a.sum>b.sum then exit(true);
	if (a.sum=b.sum)and(a.no>b.no) then exit(true);
	exit(false);
end;
procedure deal(c:longint;s:string);
var
	p,i,j:longint;
begin
	s:=s+' ';
	p:=pos(' ',s);
	val(copy(s,1,p-1),a[c].no);
	delete(s,1,p);
	p:=pos(' ',s);
	a[c].name:=copy(s,1,p-1);
	delete(s,1,p);
	for i:=1 to 10 do
		begin
			p:=pos(' ',s);
			val(copy(s,1,p-1),a[c].rec[i]);
			delete(s,1,p);
		end;
	a[c].sum:=0;
	for i:=1 to 10 do
		a[c].sum:=a[c].sum+a[c].rec[i];
end;
procedure qsort(s,t:longint);
var
	i,j:longint;
	y,k:node;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1];
	repeat
		while {(a[j].sum<k.sum)or(a[j].no<k.no)and(a[j].sum=k.sum)}a[j]>k do dec(j);
		while {(a[i].sum>k.sum)or(a[i].no>k.no)and(a[i].sum=k.sum)}a[i]<k do inc(i);
		if i<=j then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				inc(i);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
procedure print(t:node);
begin
	write(t.no,' ');
	write(t.name,' ');
	writeln(t.sum);
end;
begin
	assign(input,'lab.in');reset(input);assign(output,'lab.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		begin
			readln(s);
			deal(i,s);
		end;
	qsort(1,n);
	for i:=1 to n do
		print(a[i]);
	close(output);
end.
