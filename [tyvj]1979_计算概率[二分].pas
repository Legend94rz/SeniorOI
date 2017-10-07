var
	i,j:longint;
	m,n:int64;
	a:array[0..100001]of int64;
	l,r,mid:longint;
	sigma,t:int64;
	tmp:double;
procedure qsort(s,t:longint);
var
	i,j:longint;
	k,u:int64;
begin
	i:=s;j:=t;k:=a[(s+t) shr 1];
	repeat
		while (a[j]>k) do dec(J);
		while (a[i]<k) do inc(i);
		if i<=j then
			begin
				u:=a[j];a[j]:=a[i];a[i]:=u;
				inc(i);dec(J);
            end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
begin
	readln(n,m);
	for i:=1 to n do read(a[i]);
	qsort(1,n);
	for i:=1 to n-1 do
		begin
			l:=i+1;r:=n;
			repeat
				mid:=(l+r)shr 1;
				if a[mid]+a[i]>m then
					r:=mid-1
				else
					l:=mid+1;
			until l>r;
			sigma:=sigma+r-i;
			//writeln('>',i,' ',r-i);
        end;
	t:=int64(n*(n-1));
	tmp:=t/2;
	writeln(sigma/tmp:0:2);
end.

