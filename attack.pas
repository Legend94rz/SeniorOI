var
	i,j,n,k,m:Longint;
	Low,W,P,Q:array[0..200001]of longint;
	s:array[0..300001]of int64;
	f:array[0..200001]of int64;
	l,r,mid:longint;
function check(key:longint):boolean;
var
	i:longint;
begin
	for i:=key to n do
		if s[i]-s[i-key]<=k then
			exit(true);
	exit(false);
end;
begin
	assign(input,'attack.in');reset(input);assign(output,'attack.out');rewrite(output);
	readln(m,n,k);
	for i:=1 to m do read(w[i]);
	for i:=1 to m do read(p[i]);
	for i:=1 to n do read(q[i]);
	for i:=1 to m do
		for j:=w[i] to k do
			if f[j-w[i]]+p[i]>f[j] then
				f[j]:=f[j-w[i]]+p[i];
	for i:=1 to n do
		begin
			l:=0;r:=k;
			repeat
				mid:=(L+r)shr 1;
				if f[mid]<q[i] then
					l:=mid+1
				else
					r:=mid-1;
            until l>r;
			if f[l]>=q[i] then low[i]:=l else low[i]:=1 shl 30;
        end;
//	for i:=1 to n do write(low[i],' ');writeln;
	for i:=1 to n do s[i]:=s[i-1]+low[i];
	l:=0;r:=n;
    repeat
		mid:=(L+r)shr 1;
		if check(mid) then
			l:=mid+1
		else
			r:=mid-1;
	until l>r;
	writeln(r);
	close(output);
end.

