var
	i,j,k,n,m,t,ans,x,y:longint;
	e:array[0..250,0..250]of boolean;
	f:array[0..1000]of longint;
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
	readln(n);
	for i:=1 to n do
		begin
			e[i,i]:=true;f[i]:=i;
			while true do
				begin
					read(t);
					if t=0 then break;
					e[i,t]:=true;
				end;
		end;
	for k:=1 to n do
		for i:=1 to n do
			for j:=1 to n do
				if e[i,k]and e[k,j] then
					e[i,j]:=true;
	for i:=1 to n do
		for j:=1 to n do
			if (i<>j)and(e[i,j]) then
				begin
					x:=find(i);y:=find(j);
					if x<>y then f[x]:=y;
				end;
	for i:=1 to n do
		if f[i]=i then
			inc(ans);
	writeln(ans);
end.

