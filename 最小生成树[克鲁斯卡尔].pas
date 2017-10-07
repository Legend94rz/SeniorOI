var
	i,j,x,y:longint;
	mint,sed:longint;
	father:array[0..100000]of longint;
	a,b,e:array[0..100000]of longint;
	n,m:longint;
function getfather(x:longint):longint;
var
	t,c,f:longint;
begin
	c:=x;
	while father[x]<>x do x:=father[x];
	t:=x;
	while father[c]<>t do
		begin
		f:=father[c];
		father[c]:=t;
		c:=f;
		end;
end;
procedure qsort(s,t:longint);
var
	i,j,k,y:longint;
begin
	k:=e[(s+t)shr 1];i:=s;j:=t;
	repeat
		while e[j]>k do dec(j);
		while e[i]<k do inc(i);
		if i<=j then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				y:=b[i];b[i]:=b[j];b[j]:=y;
				y:=e[i];e[i]:=e[j];e[j]:=y;
				inc(i);dec(j);
			end;
	until i>=j;
	if(i<t) then qsort(i,t);
	if(s<j) then qsort(s,j);
end;
begin
	readlN(n,m);//µã±ß
	for i:=0 to n+1 do
		father[i]:=i;
	for i:=1 to m do
		readln(a[i],b[i],e[i]);
	qsort(1,m);
	{for i:=1 to n do
		if f[a[i]]=0  then
			f[a[i]]:=i;
	f[N+1]:=m+1;
	for i:=n downto 1 do
		if f[i]=0 then
			f[i]:=f[i+1];}
       i:=1;
	repeat
		x:=getfather(a[i]);
		y:=getfather(b[i]);
		if (x<>y) then
			begin
				inc(sed);
				father[x]:=y;
				inc(mint,e[i]);
			end;
                inc(i);
	until (sed>=n-1)or(i>m);
	writeln(mint);
end.
