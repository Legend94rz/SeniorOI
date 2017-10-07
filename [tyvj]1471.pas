var
	a:array[0..2000001]of longint;
	mid,l,r,n,m,i:longint;
	s:int64;
function checK(k:longint):boolean;
var
	i,w:longint;
	u:int64;
begin
	u:=0;w:=1;
	for i:=1 to n do
		begin
			if a[i]>k then exit(true);//太小
			if (w+n-i>=m)and(u<=k) then inc(u,a[i]);
			if u>k then
				begin
					u:=a[i];
					inc(w);
				end;
			if w>m then exit(true);//太小
		end;
	exit(false);//太大
end;
begin
	readln(n,m);
	for i:=1 to n do
		begin
			read(a[i]);
			inc(s,a[i]);
		end;
	l:=1;r:=s;
	repeat
		mid:=(l+r) shr 1;
		if check(mid) then
			l:=mid+1
		else
			r:=mid-1;
	until l>r;
	writeln(l);
end.

