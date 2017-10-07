var
	e:array[0..200,0..200]of longint;
	bq:array[0..200]of longint;
	i,j,n,m,k:longint;
	ans,min:int64;
	usd:array[0..20]of boolean;
	pl:array[0..20]of longint;
procedure cal;
var
	i:longint;
begin
	min:=0;
	for i:=1 to m+1 do
		inc(min,e[ bq[pl[i-1]] , bq[pl[i] ]]);
	if min<ans then
		ans:=min;
end;
procedure dfs(i:longint);
var
	k:longint;
begin
	if i>m then exit;
	for k:=1 to m do
		if not usd[k] then
			begin
				pl[i]:=k;
				usd[k]:=true;
				if i=m then cal;
				dfs(i+1);
				usd[k]:=false;
			end;
end;
begin
	readln(n);
	for i:=1 to n do
		for j:=1 to n do
			read(e[i,j]);
	readln(m);bq[0]:=1;
	ans:=maxlongint;
	for i:=1 to m do
		read(bq[i]);
	bq[m+1]:=n;
	for k:=1 to n do
		for i:=1 to n do
			if i<>k then
				for j:=1 to n do
					if (j<>i)and(j<>k) then
						if e[i,j]>e[i,k]+e[k,j] then
							e[i,j]:=e[i,k]+e[k,j];
	if m=0 then
		begin
			writeln(e[1,n]);
			halt;
		end;
	{for i:=1 to n do
		for j:=1 to n do
			writeln(i,' ',j,' ',e[i,j]); }
	//pl[0]:=1;
	pl[m+1]:=m+1;
	dfs(1);
	writeln(ans);
end.
