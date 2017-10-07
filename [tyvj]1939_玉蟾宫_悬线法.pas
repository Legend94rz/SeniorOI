var
	i,j,n,m:longint;
	l,r,h:array[0..2001,0..2001]of longint;
	a:array[0..2001,0..2001]of longint;
	c:char;
	ans:longint;
function min(a,b:Longint):longint;
begin
	if a<b then exit(a);exit(b);
end;
begin
	readln(n,m);
	for i:=1 to n do
		begin
			for j:=1 to m do
				begin
	                read(c);
					if c='R' then a[i,j]:=0 else a[i,j]:=1;if j<>m then read(c);
				end;
			readln;
		end;
	for i:=1 to n do begin if a[i,1]=1 then l[i,1]:=1;if a[i,m]=1 then r[i,m]:=1;end;
	for i:=1 to m do if a[1,i]=1 then h[1,i]:=1;
	for i:=1 to n do
		for j:=2 to m do
			if a[i,j]=1 then
				if (a[i,j]=a[i,j-1]) then
					l[i,j]:=l[i,j-1]+1
				else
					l[i,j]:=1;
	for i:=1 to n do
		for j:=m-1 downto 1 do
			if a[i,j]=1 then
				if a[i,j]=a[i,j+1] then
					r[i,j]:=r[i,j+1]+1
				else
					r[i,j]:=1;
	for i:=2 to n do
		for j:=1 to m do
			if a[i,j]=a[i-1,j] then
				h[i,j]:=h[i-1,j]+1
			else
				h[i,j]:=1;
	for j:=1 to m do
		for i:=2 to n do
			if a[i,j]=a[i-1,j] then
				begin
					l[i,j]:=min(l[i,j],l[i-1,j]);
					r[i,j]:=min(r[i,j],r[i-1,j]);
                end;

	for i:=1 to n do
		for j:=1 to m do
			if a[i,j]=1 then
				if h[i,j]*(r[i,j]+l[i,j]-1)>ans then
					ans:=h[i,j]*(r[i,j]+l[i,j]-1);
	writeln(ans*3);
end.

