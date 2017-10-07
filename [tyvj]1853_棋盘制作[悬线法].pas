var
	i,j,n,m,ans,t:longint;
	l,r,d,a:array[0..2001,0..2001]of longint;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
begin
	readln(n,m);
	for i:=1 to n do
		for j:=1 to m do
			read(a[i,j]);
//-------------------------------------
	fillDword(l,sizeof(l)shr 2,1);
	for i:=2 to n do
		for j:=2 to m do
			if (a[i,j]<>a[i,j-1])and(a[i,j]<>a[i-1,j]) then
				begin
					t:=l[i-1,j];
					if t>l[i-1,j-1] then t:=l[i-1,j-1];
					if t>l[i,j-1] then t:=l[i,j-1];
					l[i,j]:=t+1;
				end;
	for i:=1 to n do
		for j:=1 to m do
			if l[i,j]>ans then
				ans:=l[i,j];
	writeln(ans*ans);
//-------------------------------------
	ans:=0;
	for i:=1 to n do l[i,1]:=1;r[i,m]:=1;
	for i:=1 to m do d[1,i]:=1;
	for i:=1 to n do
		begin
			for j:=2 to m do
				if a[i,j]<>a[i,j-1] then
					l[i,j]:=l[i,j-1]+1
				else
					l[i,j]:=1;
			for j:=m-1 downto 1 do
				if a[i,j]<>a[i,j+1] then
					r[i,j]:=r[i,j+1]+1
				else
					r[i,j]:=1;
		end;
	for j:=1 to m do
		begin
			for i:=2 to n do
				if a[i-1,j]<>a[i,j] then
					d[i,j]:=d[i-1,j]+1
				else
					d[i,j]:=1;
			for i:=2 to n do
				if a[i-1,j]<>a[i,j] then
					begin
						r[i,j]:=min(r[i,j],r[i-1,j]);
						l[i,j]:=min(l[i,j],l[i-1,j]);
					end;
		end;
	for i:=1 to n do
		for j:=1 to m do
			if d[i,j]*(r[i,j]+l[i,j]-1)>ans then
				ans:=d[i,j]*(r[i,j]+l[i,j]-1);
	writeln(ans);
//---------------------------------------
end.

