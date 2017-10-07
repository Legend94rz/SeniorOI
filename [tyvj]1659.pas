var
	minw,i,j,n,m,mst,x,y:longint;
	f,w:array[0..10001]of longint;
	a,b,e:array[0..1000001]of longint;
procedure qsort(s,t:longint);
var
	k,y,i,j:longint;
begin
	i:=s;j:=t;k:=e[(s+t)shr 1];
	repeat
		while e[j]>k do dec(j);
		while e[i]<k do inc(i);
		if i<=j then
			begin
				y:=e[i];e[i]:=e[j];e[j]:=y;
				y:=a[i];a[i]:=a[j];a[j]:=y;
				y:=b[i];b[i]:=b[j];b[j]:=y;
				inc(i);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
function find(x:longint):longint;
var
	c,t:longint;
begin
	c:=x;
	while f[x]<>x do x:=f[x];
	while f[c]<>x do
		begin
			t:=f[c];
			f[c]:=x;
			c:=t;
		end;
	exit(x);
end;
begin
	readln(n,m);
	minw:=maxlongint;
	for i:=1 to n do
		f[i]:=i;
	for i:=1 to n do
		begin
			readln(w[i]);
			if w[i]<minw then
				minw:=w[i];
		end;
	for i:=1 to m do
		begin
			readln(a[i],b[i],e[i]);
			e[i]:=w[a[i]]+w[b[i]]+2*e[i];
		end;
	qsort(1,m);
	for i:=1 to m do
		begin
			x:=find(a[i]);y:=find(b[i]);
			if x<>y then
				begin
					f[x]:=y;
					inc(mst,e[i]);
				end;
		end;
	writeln(mst+minw);
end.


