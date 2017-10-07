var
	i,j,n,m:longint;
	f:array[0..1001,0..1]of longint;
	a,b,c:array[0..101]of longint;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
begin
	readln(n);
	for i:=1 to n do readln(a[i],b[i],c[i]);
	fillchar(f,sizeof(f),$3f);f[0,1]:=0;
	for i:=1 to n do
		begin
			f[i,0]:=min(f[i-1,0]+a[i],f[i-1,1]+a[i]+c[i]);
			f[i,1]:=min(f[i-1,1]+b[i],f[i-1,0]+b[i]+c[i]);
        end;
	writeln(min(f[n,0],f[n,1]));
end.

