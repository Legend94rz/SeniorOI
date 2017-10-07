var
	s:array[0..20001]of string;
	a,f:array[0..200001]of longint;
	i,j,n,m:longint;
	c,t:char;
	ans:longint;
procedure qsort(s,t:longint);
var
	i,j,k,u:longint;
begin
	i:=s;j:=t;k:=a[(s+t) shr 1];
	repeat
		while (a[j]>k) do dec(j);
		while (a[i]<k) do inc(i);
		if i<=j then
			begin
				u:=a[j];a[j]:=a[i];a[i]:=u;
				inc(i);dec(j);
            end;
	until i>=j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
begin
	readln(n);
	readln(c);
	readln(m);
	for I:=1 to n do
		readln(a[i],t,s[i]);
	if c='N' then
		begin
			qsort(1,n);
			for i:=1 to m do
				inc(ans,a[i]);
			writeln(ans);
			exit;
        end;
	fillchar(f,sizeof(f),$7f);f[0]:=0;
	for i:=1 to n do
		for j:=m downto length(s[i]) do
			if f[j-length(s[i])]+a[i]<f[j] then
				f[j]:=f[j-length(s[i])]+a[i];
	if f[m]<=100000000 then
	    writeln(f[m])
	else
		writeln('DIY');
end.
