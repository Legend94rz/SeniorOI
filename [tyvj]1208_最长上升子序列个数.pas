var
	t,i,j,n,m,ans,ans2:longint;
	a,f,g:array[0..1001]of longint;
begin
	readln(n);//n=1
	for i:=1 to n do read(a[i]);
	for i:=1 to n do
		begin
			t:=0;
			for j:=1 to i-1 do
				if (t<f[j])and(a[j]<a[i]) then
					t:=f[j];
			f[i]:=t+1;
			if f[i]>ans then ans:=f[i];
		end;
	writeln(ans);g[0]:=1;
	for i:=1 to n do
		begin
			for j:=i-1 downto 0 do
				begin
					if (a[i]=a[j])and(f[i]=f[j]) then break;
					if (a[j]<a[i])and(f[j]+1=f[i]) then g[i]:=g[i]+g[j];
				end;
            if f[i]=ans then inc(ans2,g[i]);
		end;
	writeln(ans2);
end.

