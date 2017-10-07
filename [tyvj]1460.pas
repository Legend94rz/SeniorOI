var
	k,i,j,n,m,q,l,r,mid,x,y:longint;
	f,s:array[0..100001]of longint;
	a,b,e,cnt:array[0..200000]of longint;
procedure qsort(s,t:longint);
var
	i,j,k,y:longint;
begin
	i:=s;j:=t;k:=e[(s+t) shr 1];
	repeat
		while (e[j]>k) do dec(j);
		while (e[i]<k) do inc(i);
		if i<=j then
			begin
				y:=e[j];e[j]:=e[i];e[i]:=y;
				y:=a[j];a[j]:=a[i];a[i]:=y;
				y:=b[j];b[j]:=b[i];b[i]:=y;
				inc(i);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
function find(x:longint):longint;
var
	c,t:longint;
begin
	t:=x;
	while f[x]<>x do x:=f[x];
	while f[t]<>x do
		begin
			c:=f[t];
			f[t]:=x;
			t:=c;
		end;
	exit(x);
end;
begin
	readln(n,m,q);
	for i:=1 to n do
		begin
			f[i]:=i;
			s[i]:=1;
		end;
	for i:=1 to m do
		readln(a[i],b[i],e[i]);
	qsort(1,m);
	for i:=1 to m do
		begin
			x:=find(a[i]);y:=find(b[i]);
			cnt[i]:=cnt[i-1];
			if x<>y then
				begin
					f[y]:=x;
					cnt[i]:=cnt[i]+s[x]*s[y];
					s[x]:=s[x]+s[y];
				end;
			//writeln(i,' ',cnt[i],' ',e[i]);
		end;
	for i:=1 to q do
		begin
			readln(k);
			l:=1;r:=m;
			repeat
				mid:=(l+r)shr 1;
				if e[mid]<=k then
					l:=mid+1
				else
					r:=mid-1;
			until l>r;
			//x:=find(a[r]);
			writeln(cnt[r]);
			//writeln('l at ',l,' is ',e[l],',mid at ',mid,' is ',e[mid],',r at ',r,' is ',e[r],',ans is:',cnt[r]);
		end;
end.

