var
	i,j,n:longint;
	f:array[0..1000001]of int64;
	a:array[0..5001]of longint;
	ans,m,v:int64;
begin
	readln(m,n);
	for i:=1 to n do begin read(a[i]);inc(v,a[i]);end;
	f[0]:=1;
	for I:=1 to n do
		for j:=v downto a[i] do
			inc(f[j],f[j-a[i]]);
	i:=v;ans:=0;
	while (m>0) do
		begin
			if m>=f[i] then begin inc(ans,f[i]*i);dec(m,f[i]);end else
			begin
				inc(ans,m*i);m:=0;
            end;
			dec(i);
        end;
	writeln(ans);
end.

