var
	i,j,n,s:longint;
	a,k,fi:array[0..10001]of longint;
	f,sumT,sumf:array[0..10001]of int64;
begin
	readln(N);
	readln(s);
	for i:=1 to n do f[i]:=9999999999999;//f[0]:=0;
	for i:=1 to n do begin readln(a[i],fi[i]);sumT[i]:=sumT[i-1]+a[i];sumf[i]:=sumf[i-1]+fi[i];end;
	for i:=1 to n do
		for j:=0 to i-1 do
			if f[j]+(SumF[i]-sumF[j])*(s+sumT[i])+s*(SumF[n]-SumF[i])<f[i] then
				f[i]:=f[j]+(SumF[i]-sumF[j])*(S+sumT[i])+s*(SumF[n]-SumF[i]);
	writeln(f[n]);
end.

