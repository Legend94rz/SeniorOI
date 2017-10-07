program ty1307;
var
	p,u,v,w,x,y,i,j,n,m:Longint;
	a,b,e,father:array[0..10005]of longint;
	mst:int64;
procedure qsort(s,t:longint);
var
	i,j,k,y:longint;
begin
	i:=s;j:=t;k:=e[(s+t)shr 1];
	repeat
		while e[j]>k do dec(j);
		while e[i]<k do inc(I);
		if i<=j then
			begin
				y:=e[i];e[i]:=e[j];e[j]:=y;
				y:=a[i];a[i]:=a[j];a[j]:=y;
				y:=b[i];b[i]:=b[j];b[j]:=y;
				inc(i);dec(J);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
function getfather(x:longint):longint;
var
	t,f:longint;
begin
	t:=x;
	while father[x]<>x do x:=father[x];
	while t<>x do
		begin
			f:=father[t];
			father[t]:=x;
			t:=f;
		end;
	exit(x);
end;
begin
	readln(n,m);
	for i:=1 to n do
		father[i]:=i;
	for i:=1 to m do
		begin
			readln(p,u,v,w);
			if p=1 then
				begin
					x:=getfather(u);y:=getfather(v);
					father[x]:=y;
					inc(mst,w);
				end;
			a[i]:=u;b[i]:=v;e[i]:=w;
		End;
	qsort(1,m);
	for i:=1 to m do
		begin
			x:=getfather(a[i]);y:=getfather(b[i]);
			if x<>y then
				begin
					inc(mst,e[i]);
					father[x]:=y;
				end;
		end;
	writeln(mst);
end.
