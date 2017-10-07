var
	i,j,n,m,p:longint;
	t:int64;
	a:array[0..101]of longint;
	f:array[-1..201,-1..201]of longint;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
begin
	readln(n,m);
	if (m+3>n shr 1) then begin writeln(-1);exit;end;
	for i:=1 to n do read(a[i]);
	for i:=1 to n-1 do
		begin
			t:=i;
			for j:=i+1 to n do
				if a[j]<a[t] then
					t:=j;
			p:=a[i];a[i]:=a[t];a[t]:=p;
		end;
	fillchar(f,sizeof(f),$3f);
	f[0,0]:=0;
	for i:=1 to n do
		for j:=0 to i shr 1 do
			begin
				f[i,j]:=min(f[i-1,j],f[i-2,j-1]+(a[i]-a[i-1])*(a[i]-a[i-1]));
            end;
	writeln(f[n,m+3]);
end.


