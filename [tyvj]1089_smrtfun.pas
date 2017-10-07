var
	i,j,n,m,s1,s2,ans:longint;
	a,b,f:array[-400000..400000]of longint;
begin
	readln(n);
	for i:=1 to n do
		begin
    		readln(a[i],b[i]);
			if a[i]<0 then
				inc(s1,a[i])
			else
				inc(s2,a[i]);
        end;
	fillchar(f,sizeof(f),$80);f[0]:=0;
	for i:=1 to n do
		if a[i]>=0 then
			begin
				for j:=s2 downto s1 do
					if (f[j-a[i]]+b[i]>f[j]) then
						f[j]:=f[j-a[i]]+b[i];
			end
		else
			begin
				for j:=s1 to s2 do
					if (f[j-a[i]]+b[i]>f[j]) then
						f[j]:=f[j-a[i]]+b[i];
            end;
	for i:=s2 downto 0 do
		if (f[i]+i>ans)and(f[i]>=0) then
			ans:=f[i]+i;
	writeln(ans);
end.

