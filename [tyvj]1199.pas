var
	max,i,j,n,m,v:longint;
	f:array[0..200000]of longint;
	a:array[0..200]of longint;
begin
	readln(n);
	readln(m);
	for i:=1 to m do
		begin
			readln(a[i]);
			if a[i]>max then max:=a[i];
		end;
	v:=max*n+2;fillchar(f,sizeof(f),$7f);f[0]:=0;
	for i:=1 to v do
		begin
			for j:=1 to m do
				if i>=a[j] then
					if (f[i-a[j]]+1<f[i]) then
						f[i]:=f[i-a[j]]+1;
			if f[i]>n then
				begin
					writeln(i-1);
					break;
				end;
		end;
end.

