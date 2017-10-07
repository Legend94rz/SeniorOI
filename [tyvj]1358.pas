const
	none='No Such User';
type
	node=record
		s:string[20];
		da:double;
		end;
var
	i,j,n,m,p,l,r,mid:longint;
	a:array[0..100001]of node;
	s:string;
	t:double;
procedure qsort(s,t:longint);
var
	i,j:longint;
	k:double;
	y:node;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1].da;
	repeat
		while (a[j].da>k) do dec(j);
		while (a[i].da<k) do inc(i);
		if i<=j then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				inc(i);dec(j);
			end;
	until i>j;
	if(s<j) then qsort(s,j);
	if(i<t) then qsort(i,t);
end;
begin
	readln(n);
	for i:=1 to n do
		begin
			readln(s);
			p:=pos(' ',s);
			a[i].s:=copy(s,1,p-1);
			val(copy(s,p+1,length(s)-p),a[i].da);
		end;
	qsort(1,n);
	readln(m);
	for i:=1 to m do
		begin
			readln(t);
			l:=1;r:=n;
			repeat
				mid:=(l+r)shr 1;
				if a[mid].da>=t then
					r:=mid-1
				else
					l:=mid+1;
			until l>r;
			if (a[l].da=t) then
				writeln(a[l].s,' ',l)
			else
				writeln(none);
		end;
end.

