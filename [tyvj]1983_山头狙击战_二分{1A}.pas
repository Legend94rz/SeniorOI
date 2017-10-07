var
	i,j,n,m:longint;
	a:array[0..1000001]of longint;
	l,r,mid:longint;
procedure qsort(s,t:longint);
var
	i,j,k,u:longint;
begin
	i:=s;j:=t;k:=a[(s+t) shr 1];
	repeat
		while a[j]>k do dec(j);
		while a[i]<k do inc(i);
		if i<=j then
			begin
				u:=a[j];a[j]:=a[i];a[i]:=u;
				inc(i);dec(J);
            end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
function check(key:longint):boolean;
var
	i,p:longint;
begin
	p:=a[1]-m;if p<0 then p:=0;
	for i:=2 to n do
		begin
			p:=p+key;
			if a[i]-p>=0 then
				begin
					if a[i]-p>m then p:=a[i]-m;
				end
			else
				exit(false);
        end;
	exit(true);
end;
begin
	readln(n,m);
	for i:=1 to n do readln(a[i]);
	qsort(1,n);
	l:=0;r:=m;
	repeat
		mid:=(l+r) shr 1;
		if check(mid) then
			l:=mid+1
		else
			r:=mid-1;
	until l>r;
	writeln(r);
end.

