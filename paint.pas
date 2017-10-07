uses math;
var
	i,j,n,m,p,q:longint;
	a,f:array[0..1000001]of longint;
	h,l,t:longint;
begin
	assign(input,'paint.in');reset(input);assign(output,'paint.out');rewrite(output);
	readln(n,m,p,q);
	for i:=0 to n do f[i]:=i+1;
	for i:=m downto max(1,m-n+1) do
		begin
			l:=min((i*p+q)mod n+1,(i*q+p)mod n+1);
			h:=max((i*p+q)mod n+1,(i*q+p)mod n+1);
			while l<=h do
				begin
					t:=f[l];
					if (a[l]=0) then
						begin
							a[l]:=i;
							f[l]:=h+1;
						end;
					l:=t;
				end;
		end;
	for i:=1 to n do
		writeln(a[i]);
	close(output);
end.
