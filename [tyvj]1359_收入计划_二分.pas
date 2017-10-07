var
	i,j,n,m:longint;
	l,r,mid:longint;
	a:array[0..100001]of longint;
function check(keY:longint):longint;
var
	i:Longint;
	tmp:longint;
begin
	check:=0;a[n+1]:=$3f3f3f3f;i:=1;
	while true do
		begin
            tmp:=0;
			while tmp+a[i]<=key do begin tmp:=tmp+a[i];inc(i);end;
			inc(check);
			if i>n then break;
        end;
end;
begin
	readln(n,m);
	for i:=1 to n do
		begin
			readln(a[i]);
			if a[i]>l then l:=a[i];
			inc(r,a[i]);
		end;
	repeat
		mid:=(l+r)shr 1;
		if check(mid)<=m then
			r:=mid-1
		else
			l:=mid+1;
	until l>r;
	writeln(l);
end.

