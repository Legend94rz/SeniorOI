var
	i,j,k,x:longint;
	n,m,t,a,num:longint;
	ss:string;
	val,cost:array[0..1000005]of longint;
	cc:array[0..101,0..101]of longint;
	f:array[0..1000005]of longint;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
		exit(b);
end;
begin
	assign(input,'manor.in');reset(input);
	assign(output,'manor.out');rewrite(output);
	readln(n,m,t,a);
	for i:=1 to n do
		readln(ss);
	for i:=1 to n do
		for j:=1 to m do
			read(cc[i,j]);
	reset(input);readlN(ss);
	for i:=1 to n do
		for j:=1 to m do
			begin
				read(k);
				if k<>0 then
					for x:=1 to cc[i,j] do
						begin
							inc(num);
							//writeln(cc[i,j],' ',num);
							val[num]:=k;
							cost[num]:=(i+j)*2;
						end;
			end;
	{writeln('num=',num);
	for i:=1 to n do
		begin
			for j:=1 to m do
				write(cc[i,j],' ');
			writeln;
		end;}
	for i:=1 to num do
		for j:=min(t,a-1) downto cost[i] do
			if f[j-cost[i]]+val[i]>f[j] then
				f[j]:=f[j-cost[i]]+val[i];
	writeln(f[min(t,a-1)]);
	close(output);
end.

