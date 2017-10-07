var
	x,y,i,j,n,m,p,ans:longint;
	f:array[0..300001]of longint;
	vis:array[0..300001]of boolean;
function find(x:longint):longint;
var
	t,c:longint;
begin
	t:=x;
	while x<>f[x] do x:=f[x];
	while f[t]<>x do
		begin
			c:=f[t];
			f[t]:=x;
			t:=c;
		end;
	exit(x);
end;
begin
	readln(n,m,p);
	for i:=1 to n+m do
		f[i]:=i;
	for i:=1 to p do
		begin
			readln(x,y);
			vis[x]:=true;vis[y+n]:=true;
			x:=find(x);y:=find(y+n);
			if x<>y then
				f[y]:=x;
		end;
	for i:=1 to n+m do
		if (f[i]=i)and(vis[i]) then
			inc(ans);
	writeln(ans-1);
end.

