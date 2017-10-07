var
	i,j,l,n,k:longint;
	f:array[0..1000,0..1000]of int64;
	a:array[0..1001]of longint;
function min(a,b:int64):int64;
begin
	if a<b then exit(a);
	exit(b);
end;
begin
	readln(n);
	for i:=1 to n+1 do read(a[i]);
	filldword(f,sizeof(f)shr 4,maxlongint);
	for i:=1 to n do f[i,i]:=0;
	for l:=2 to n do
		for i:=1 to n-l+1 do
			begin
				j:=l+i-1;
				for k:=i to j-1 do
					f[i,j]:=min(f[i,j],f[i,k]+f[k+1,j]+a[i]*a[k+1]*a[j+1]);
            end;
	writeln(f[1,n]);
end.

