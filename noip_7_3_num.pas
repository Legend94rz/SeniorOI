var
	i,j,n,k:Longint;
	s:string;
	a,b,c:longint;
        f:boolean;
begin
	assign(input,'num.in');reset(input);
	assign(output,'num.out');rewrite(output);
	readln(k);
	for i:=10000 to 30000 do
		begin
			str(i,s);
			val(copy(s,1,3),a);
			val(copy(s,2,3),b);
			val(copy(s,3,3),c);
			if (a mod k=0)and(b mod k =0)and(c mod k=0) then
				begin
					writeln(i);
					f:=true;
				end;
		end;
	if  not f then writeln('No');
	close(input);close(output);
end.
