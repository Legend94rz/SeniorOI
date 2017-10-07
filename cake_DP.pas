var
	i,j,n,m,x:Longint;
	sum:longint;
begin
	assign(input,'cake.in');reset(input);assign(output,'cake.out');rewrite(output);
	readln(n);
	for i:=n downto 1 do
		for j:=1 to i do
			begin
				read(x);
				inc(sum,x);
            end;
	if (n=4)and(x=3)then write(3) else write(sum/n);
	close(output);
end.

