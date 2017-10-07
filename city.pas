program city;
var
	fa:array[0..100000]of longint;
	n,m,i,x,y,mst:longint;
	a,b,e:array[0..100000]of longint;
procedure qsort(s,t:longint);
var
	i,j,k,y:longint;
begin
	i:=s;j:=t;k:=e[(s+t)shr 1];
	repeat
		while e[j]>k do dec(j);
		while e[i]<k do inc(i);
		if i<=j then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				y:=b[i];b[i]:=b[j];b[j]:=y;
				y:=e[i];e[i]:=e[j];e[j]:=y;
				inc(i);dec(j);
			End;
	Until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
function getfather(x:longint):longint;
var
	t,c,f:longint;
begin
	t:=x;
	while fa[x]<>x do x:=fa[x];
	while t<>x do
		begin
			c:=fa[t];
			fa[t]:=x;
			t:=c;
		end;
	exit(x);
end;
begin
	assign(input,'city.in');reset(input);assign(output,'city.out');rewrite(output);
	readln(n,m);
	for i:=1 to m do
		readln(a[i],b[i],e[i]);
	qsort(1,m);
	for i:=1 to n do
		fa[i]:=i;
	for i:=1 to m do
		begin
			x:=getfather(a[i]);
			y:=getfather(b[i]);
			if x<>y then
				begin
					fa[x]:=y;
					mst:=e[i];
				end;
		End;
	writeln(n-1,' ',mst);
	close(output);
end.
