var
	i,j,n,m,k,s,t:longint;
	a:array[0..201]of longint;
	e:array[0..201,0..201]of longint;
begin
	readln(n,s,t);
	fillchar(e,sizeof(e),$3f);
	for i:=1 to n do
		begin
			read(a[i]);e[i,i]:=0;
			if i+a[i]<=n then e[i,i+a[i]]:=1;
			if i-a[i]>=1 then e[i,i-a[i]]:=1;
		end;
	for k:=1 to n do
		for i:=1 to n do
			if i<>k then
				for j:=1 to n do
					if (i<>j)and(j<>k)then
						if e[i,k]+e[k,j]<e[i,j] then
							e[i,j]:=e[i,k]+e[k,j];
	if e[s,t]<>$3f3f3f3f then
		writeln(e[s,t])
	else
		writeln(-1);
end.

