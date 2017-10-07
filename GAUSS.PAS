VAR
	k,i,j,n,m,count:longint;
	a:array[0..1001,0..1001]of double;
	x:array[0..1001]of double;
	sum,t:double;
	tmp:array[0..1001]of double;
begin
	readln(n,m);
	for i:=1 to m do
		for j:=1 to n+1 do
			read(a[i,j]);
	for i:=1 to n-1 do
		begin
			k:=i;
			for j:=i+1 to m do
				if a[j,i]>a[k,i] then
					k:=j;
			tmp:=a[k];a[k]:=a[i];a[i]:=tmp;
			for j:=i+1 to m do
				begin
					if a[j,i]<>0 then t:=a[i,i]/a[j,i] else continue;
					for k:=i to n+1 do
						a[j,k]:=a[i,k]-a[j,k]*t;
				end;
        end;
	for i:=1 to n do if a[m,i]<>0 then inc(count);
	if count>1 then begin writeln('inf');exit;end;
	if a[m,n]<>0 then
        x[n]:=a[m,n+1]/a[m,n]
    else
		begin
			if a[m,n+1]=0 then writeln('inf')else writeln(-1);
			exit;
		end;
	for i:=m-1 downto 1 do
		begin
			sum:=0;
			for j:=i+1 to n do sum:=sum+a[i,j]*x[j];
			x[i]:=(a[i,n+1]-sum)/a[i,i];
		end;
	for i:=1 to n do write(x[i]:0:3,' ');writeln;
end.

