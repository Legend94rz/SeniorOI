var
   i,j:longint;
   a,s,b:array[0..100005]of longint;
   n,m:longint;
   ans:int64;
procedure merge(l,r:longint);
var
   k,mid,i,j:longint;
begin
	if l=r then exit;
	mid:=(L+r)shr 1;
	merge(l,mid);
	merge(mid+1,r);
	i:=l;j:=mid+1;k:=l;
	while (i<=mid)and(j<=r) do
		if s[i]<=s[j] then
			begin
				b[k]:=s[i];
				inc(k);
				inc(i);
			end
	else
		begin
			inc(ans,i-l);
			b[k]:=s[j];
			inc(j);
			inc(k);
		end;
	if i<=mid then
		for j:=i to mid do
			begin
				b[k]:=s[j];
				inc(k);
			end
	else
		for i:=j to r do
			begin
				b[k]:=s[i];
				inc(k);
				inc(ans,mid-l+1);
			end;
	for i:=l to r do
		s[i]:=b[i];
end;
begin
	assign(input,'ciphertext.in');reset(input);assign(output,'ciphertext.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		begin
		read(a[i]);
	s[i]:=s[i-1]+a[i];
		end;
	merge(0,n);
	writelN(ans);
	close(input);close(output);
end.
