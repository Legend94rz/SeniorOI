var
	i,j,n,m,ans:longint;
	v,count:array[0..101]of longint;
	f:array[0..1000001]of boolean;
procedure mutiple(vi,ni:longint);
var
	k,i:longint;
begin
	k:=1;
	while ni>0 do
		begin
			if ni<k then k:=ni;
			ni:=ni-k;
			for i:=
                        m downto k*vi do
				if f[i-k*vi] then
					f[i]:=true;
			k:=k shl 1;
        end;
end;
begin
	readln(n,m);
	for i:=1 to n do read(v[i]);
	for i:=1 to n do read(count[i]);
	f[0]:=true;
	for i:=1 to n do
		mutiple(v[i],count[i]);
	for i:=1 to m do
		if f[i] then
			inc(ans);
	writeln(ans);
end.

