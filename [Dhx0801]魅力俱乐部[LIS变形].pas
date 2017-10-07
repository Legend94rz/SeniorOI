var
	i,j,n,la:longint;
	a:array[0..100001,1..2]of longint;
	f:array[0..100001]of longint;
	mid,l,r:longint;
procedure qsort(s,t:longint);
var
	i,j,k,k2:longint;
	u:array[1..2]of longint;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1,1];k2:=a[(s+t)shr 1,2];
	repeat
		while (a[j,1]>k)or(a[j,1]=k)and(a[j,2]<k2) do dec(j);
		while (a[i,1]<k)or(a[i,1]=k)and(a[i,2]>k2) do inc(i);
		if i<=j then
			begin
				u:=a[i];a[i]:=a[j];a[j]:=u;
				inc(i);dec(j);
            end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (I<t) then qsort(i,t);
end;
begin
	assign(Input,'1.in');reset(input);assign(output,'1.out');rewrite(output);
	readln(n);
	for I:=1 to n do readln(a[i,1],a[i,2]);
	qsort(1,n);f[0]:=$3f3f3f3f;
	{for i:=1 to n do
		writeln('>',a[i,1],' ',a[i,2]);}
	for i:=1 to n do
		begin
			l:=0;r:=la;
			repeat
				mid:=(l+r)shr 1;
				if f[mid]>=a[i,2] then
					l:=mid+1
				else
					r:=mid-1;
			until l>r;
			f[l]:=a[i,2];
			if l>la then la:=l;
        end;
	writeln(la);
	close(output);
end.

