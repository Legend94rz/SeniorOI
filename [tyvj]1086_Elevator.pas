var
	i,j,k,n,x,y,z,tot,m:longint;
	a,h,c:array[0..5000]of longint;
	f:array[0..400000]of boolean;
procedure qsort(s,t:longint);
var
	i,j,k,u:longint;
begin
	i:=s;j:=t;k:=a[(s+t) shr 1];
	repeat
		while (a[j]>k) do dec(j);
		while (a[i]<k) do inc(i);
		if (i<=j) then
			begin
				u:=a[i];a[i]:=a[j];a[j]:=u;
				u:=h[i];h[i]:=h[j];h[j]:=u;
				inc(i);dec(j);
            end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
begin
	readln(n);
	for i:=1 to n do
		begin
			readln(x,y,z);inc(m,x*z);
			for j:=1 to z do
				begin
					inc(tot);
					h[tot]:=x;a[tot]:=y;
                end;
        end;
	n:=tot;
	qsort(1,n);f[0]:=true;
	for i:=1 to n do
			for j:=a[i] downto h[i] do
				if f[j-h[i]] then
					f[j]:=true;
	for i:=m downto 0 do
		if f[i] then
			begin
				writeln(i);
				exit;
            end;
end.

