var
	i,j,n,m:LONGINT;
	q,a,app:array[0..200005]of longint;
	l,r:longint;
	count,ans:longint;
begin
	readln(n,m);
	for i:=1 to n do
		read(a[i]);
	l:=1;r:=0;ans:=maxlongint;
	for i:=1 to n do
		begin
			inc(r);
			q[r]:=a[i];
			inc(app[a[i]]);
			if app[a[i]]=1 then inc(count);
			if q[r]=q[l] then
				begin
					while app[q[l]]>1 do
						begin
							dec(app[q[l]]);
							inc(l);
						end;

				end;
			if (count=m)and(ans>r-l+1) then
				ans:=r-l+1;
		end;
	if (ans=maxlongint)or(m>count) then
		writeln('NO')
	else
		writelN(ans);
end.

