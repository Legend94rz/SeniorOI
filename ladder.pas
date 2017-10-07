var
	a:array[0..1000]of longint;
	i,j,k,n:longint;
	f:array[0..1000]of longint;
function min(a,b:Longint):Longint;
begin
	if a<b then exit(a);
	exit(b);
end;
BEGIN
	assign(input,'ladder.in');reset(input);ASSIGN(OUTPUT,'ladder.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		read(a[i]);
	fillDword(f,sizeof(f)div 4,maxlongint);
	f[1]:=0;
	for i:=2 to n do
		begin
			if a[i]-a[i-1]=1 then f[i]:=f[i-1]+1;
			for j:=1 to i-1 do
				for k:=1 to j do
					if a[k]+(1 shl (j-K)) >=a[i] then
						f[i]:=min(f[i],f[j]+j-k+1);
		end;
	if f[n]<maxlongint then
		writeln(f[n])
	else
		writelN(-1);
	close(output);
END.
