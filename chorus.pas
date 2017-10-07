var
	a,ans:array[1..200]of longint;
	f:array[0..200,1..2]of longint;
	n,i,j,k,max1,l,max2:longint;
begin
	assign(input,'chorus.in');reset(input);assign(output,'chorus.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		read(a[i]);
	for i:=1 to n do
		begin
			for j:=1 to n do
				begin
					f[j,1]:=1;
					f[j,2]:=1;
				end;
			for j:=i-1 downto 1 do
				begin
					l:=0;
					for k:=j+1 to i do
						begin
							if(a[k]>a[j])and(f[k,1]>l)then
								l:=f[k,1];
							if(l>0)then
								f[j,1]:=l+1;
						end;
				end;
			for j:=i+1 to n do
				begin
					l:=0;
					for k:=j-1 downto i do
						begin
							if (a[k]>a[j])and(f[k,2]>l)then
								l:=f[k,2];
							if(l>0)then
								f[j,2]:=l+1;
						end;
				end;
			max1:=f[1,1];
			for j:=1 to i do
				if(f[j,1]>max1)then max1:=f[j,1];
			max2:=f[i,2];
			for j:=i to n do
				if(f[j,2]>max2)then max2:=f[j,2];
			ans[i]:=n-(max1+max2-1);
		end;
	max1:=ans[1];
	for i:=2 to n do
		if(ans[i]<max1)then max1:=ans[i];
	writeln(max1);
	close(input);close(output);
end.
