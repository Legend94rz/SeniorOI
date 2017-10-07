var
	u,i,j,n,t,p:longint;
	f:boolean;
	a:array[0..100]of longint;
begin
	assign(input,'Onim.in');reset(input);assign(output,'Onim.out');rewrite(output);
	read(t);
	for u:=1 to t do
		begin
			read(n);f:=true;p:=0;
			for i:=1 to n do
				begin
					read(a[i]);
					f := f and(a[i]=1);
					if (a[i]>1) and(p=0) then p:=i;
				end;
			if f then
				begin
					if n mod 2 = 1 then
						writeln('LazyChild')
					else
						writeln('Dr.vt');
					continue;
				end;
			if p mod 2 =1 then
				writeln('LazyChild')
			else
				writeln('Dr.vt');
		end;
	close(output);
end.

