type
	node=record
		num,da:int64;
		end;
var
	i,j,n,m:longint;
	ans:int64;
	a:array[0..100001]of node;
	c:array[0..100001]of int64;
procedure qsort(s,t:longint);
var
	i,j,k:longint;
	y:node;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1].num;
	repeat
		while (a[j].num>k) do dec(j);
		while (a[i].num<k) do inc(i);
		if i<=j then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				inc(i);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
procedure merge(s,t:longint);
var
	i,j,k,x:longint;
begin
	k:=(s+t)shr 1;
	i:=s;j:=k+1;x:=s;
	while x<=t do
		begin
			if (i<=k)and((j>t)or(a[i].da<=a[j].da)) then
				begin
					c[x]:=a[i].da;
					inc(i);
				end
			else
				begin
					c[x]:=a[j].da;
					inc(j);
					if i<=k then
						inc(ans,k-i+1);
				end;
			inc(x);
		end;
	for i:=s to t do
		a[i].da:=c[i];
end;
procedure msort(s,t:longint);
var
	k:longint;
begin
	if s>=t then exit;
	k:=(s+t)shr 1;
	msort(s,k);msort(k+1,T);
	merge(s,t);
end;
begin
	readln(n);
	for i:=1 to n do read(a[i].num);
	for i:=1 to n do read(a[i].da);
	qsort(1,n);msort(1,n);
	writeln(ans);
end.

