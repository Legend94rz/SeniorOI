var
	k,i,j,n,m:longint;
	f:array[0..2000001]of int64;
	a,b,e:array[0..2000001]of int64;
	ans,x,y,mm:int64;
procedure qsort(s,t:longint);
var
	k,u,i,j:longint;
begin
	i:=s;j:=t;k:=e[(s+t)shr 1];
	repeat
		while (e[j]>k) do dec(j);
		while (e[i]<k) do inc(i);
		if i<=j then
			begin
				u:=a[i];a[i]:=a[j];a[j]:=u;
				u:=b[i];b[i]:=b[j];b[j]:=u;
				u:=e[i];e[i]:=e[j];e[j]:=u;
				inc(i);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
function find(x:longint):longint;
var
	t,c:longint;
begin
	t:=x;
	while f[x]<>x do x:=f[x];
	while f[t]<>x do
		begin
			c:=f[t];
			f[t]:=x;
			t:=c;
		end;
	exit(x);
end;
begin
	readln(n,m,k);
	for i:=1 to m do
		readln(a[i],b[i],e[i]);
	qsort(1,m);
	for I:=1 to n do f[i]:=i;
	for i:=1 to m do
		begin
			x:=find(a[i]);y:=find(b[i]);
			if x<>y then
				begin
					f[x]:=y;
					inc(ans,e[i]);
				end;
		end;
	for i:=1 to n do
		if find(i)<>find(k) then
			inc(mm);
	if mm<>0 then
		writeln(mm)
	else
		writeln(ans);
end.

