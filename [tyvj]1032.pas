uses
	math;
var
	i,j,n,m,c,t:longint;
	a:array[0..30,1..2]of longint;
	ans:int64;
	flag:boolean;
begin
	readln(n,m);
	for i:=1 to n do
		readln(a[i,1],a[i,2]);
	for i:=1 to n do
		for j:=1 to n-1 do
			if a[j,1]<a[j+1,1] then
				begin
					a[0]:=a[j];a[j]:=a[j+1];a[j+1]:=a[0];
				end;
	{for i:=1 to n do
		writeln(a[i,1],' ',a[i,2]);}
	j:=0;
	for i:=1 to n do
		if a[i,1]>=m then
			inc(ans,a[i,2])
		else
			begin
				j:=i;
				break;
			end;
	flag:=true;
	while (flag)and(j<>0) do
		begin
			c:=m;flag:=false;
			for i:=j to n do
				while (a[i,2]>0)and(a[i,1]<=c) do
					begin
						dec(a[i,2]);
						dec(c,a[i,1]);
					end;
			if c=0 then
				begin
					inc(ans);
					flag:=true;
					continue;
				end;
			for i:=n downto j do
				if (a[i,2]>0) then
					begin
						dec(a[i,2]);
						inc(ans);flag:=true;break;
					end;
			//if c=0 then begin flag:=true;inc(ans);end;
		end;
	writeln(ans);
end.
