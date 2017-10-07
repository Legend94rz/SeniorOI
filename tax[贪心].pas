uses
	math;
var
	i,j,n,m,k:longint;
	a:array[0..25,1..2]of longint;
	t:array[1..2]of longint;
	ans:int64;
	f:boolean;
begin
	assign(input,'tax.in');reset(input);assign(output,'tax.out');rewrite(output);
	readln(n,m);
	for i:=1 to n do
		readln(a[i,1],a[i,2]);
	for i:=1 to n do
		for j:=1 to n-1 do
			if a[j,1]<a[j+1,1]  then
				begin
					t:=a[j];a[j]:=a[j+1];a[j+1]:=t;
				end;
	j:=0;
	for i:=1 to n do
		if a[i,1]>=m then
			begin
				inc(ans,a[i,2]);
				a[i,2]:=0;
			end
		else
			begin
				j:=i;
				break;
			end;
	f:=true;
	while f and (j<>0) do
		begin
			k:=m;f:=false;
			for i:=j to n do
				while (a[i,1]<=k)and(a[i,2]>0) do
					begin
						dec(a[i,2]);
						dec(k,a[i,1]);
					end;
			if k=0 then
				begin
					inc(ans);
					f:=true;
					continue;
				end;
			for i:=n downto j do
				if a[i,2]>0 then
					begin
						inc(ans);
						dec(a[i,2]);
						f:=true;
						break;
					end;
		end;
	writeln(ans);
	close(output);
end.
