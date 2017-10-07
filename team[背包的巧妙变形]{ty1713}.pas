var
	i,j,n:longint;
	f:array[0..1000001]of int64;
	w:array[0..501]of longint;
	sum,ans,m:int64;
begin
	assign(input,'team.in');reset(input);assign(output,'team.out');rewrite(output);
	readln(m,n);
	for i:=1 to n do
		begin
			read(w[i]);
			inc(sum,w[i]);
        end;
	f[0]:=1;
	for i:=1 to n do
		for j:=sum downto w[i] do
			begin
				inc(f[j],f[j-w[i]]);
            end;
	i:=sum;
	while m>0 do
		begin
			if m>=f[i] then begin inc(ans,i*f[i]);dec(m,f[i]);end
			else
				begin
					inc(ans,m*i);m:=0;
				end;
			dec(i);
		end;
	writeln(ans);
	close(output);
end.

