var
	i,j,n,m,q,key:Longint;
	a,b,e:array[0..300001]of longint;//重边！
	ans:array[0..300001]of int64;
	f,s:array[0..105001]of longint;
	x,y,z:longint;
	l,r,mid:longint;
procedure qsort(s,t:longint);
var
	i,j,k,u:longint;
begin
	i:=s;j:=t;k:=e[(S+t)shr 1];
	repeat
		while e[j]>k do dec(j);
		while e[i]<k do inc(I);
		if i<=j then
			begin
				u:=e[i];e[i]:=e[j];e[j]:=u;
				u:=a[i];a[i]:=a[j];a[j]:=u;
				u:=b[i];b[i]:=b[j];b[j]:=u;
				inc(i);dec(j);
            end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (I<t) then qsort(i,t);
end;
function getf(x:longint):longint;
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
	assign(input,'tour.in');reset(input);assign(output,'tour.out');rewrite(output);
	readln(n,m,q);
	for i:=1 to n do begin f[i]:=i;s[i]:=1;end;
	for i:=1 to m do readln(a[i],b[i],e[i]);
	qsort(1,m);
	for i:=1 to m do
		begin
			x:=getf(a[i]);y:=getf(b[i]);
			if x<>y then
				begin
					f[x]:=y;ans[i]:=ans[i-1]+int64(s[x]*s[y]);
                    s[y]:=s[x]+s[y];
				end
			else
				ans[i]:=ans[i-1];
        end;
//	for i:=1 to m do writeln('>>',i,' ',ans[i]);
	for i:=1 to q do
		begin
			readln(key);
			l:=1;r:=m;
			repeat
				mid:=(l+r)shr 1;
				if e[mid]<=key then
					l:=mid+1
				else
					r:=mid-1;
			until l>r;
//			writeln('r=',r);
			writeln(ans[r]);
        end;
	close(output);
end.

