var
	a:array[0..100000]of longint;
	i,j,n,k:longint;
procedure qsort(s,t:longint);
var
	i,j,k,u:longint;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1];
	repeat
		while a[j]>k do dec(j);
		while a[i]<k do inc(i);
		if i<=j then
			begin
				u:=a[i];a[i]:=a[j];a[j]:=u;
				inc(i);dec(j);
            end;
	until i>=j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
function judge(k:longint):string;
var
	i:longint;
begin
	if k<2 then exit('NO');
	for i:=2 to trunc(sqrt(k)) do
		if k mod i = 0 then exit('NO') ;
	exit('YES');
end;
begin
	readln(n,k);
	for i:=1 to n do
		read(a[i]);
	qsort(1,n);
	writeln(judge(a[n-k+1]-a[k]));
	writeln(a[n-k+1]-a[k]);
end.
