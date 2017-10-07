var
	i,j,n,m,ans:Longint;
	a,b:array[0..100001]of longint;
procedure qsort(s,t:Longint);
var
	i,j,k,u:Longint;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1];
	repeat
		while (a[j]<k) do dec(j);
		while (a[i]>k) do inc(I);
		if i<=j then
			begin
				u:=a[i];a[i]:=a[j];a[j]:=u;
				inc(i);dec(j);
            end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
begin
	readln(n);
	for i:=1 to n do read(a[i]);
	qsort(1,n);
	for I:=1 to n shr 1 do
		begin
			inc(j);b[j]:=a[i];
			inc(j);b[j]:=a[n-i+1];
        end;
	for i:=2 to j do ans:=ans+abs(b[i]-b[i-1]);
	ans:=ans+abs(b[1]-b[j]);
	writeln(ans);
end.

