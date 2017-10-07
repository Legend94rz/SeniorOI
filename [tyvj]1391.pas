var
	x,y,i,j,n,m,u,t:longint;
	f,s:array[0..10000]of longint;
	a,b,e:array[0..3600000]of longint;
	ans:longint;
procedure qsort(s,t:longint);
var
	u,i,j,k:longint;
begin
	i:=s;j:=t;k:=e[(s+t)shr 1];
	repeat
		while (e[j]>k) do dec(j);
		while (e[i]<k) do inc(i);
		if i<=j then
			begin
				u:=a[i];a[i]:=a[j];a[j]:=u;
				u:=b[i];b[i]:=b[j];b[j]:=u;
				u:=e[i];e[i]:=e[j];e[j]:=u;
				inc(i);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
function find(x:longint):longint;
var
	t,c:longint;
begin
	t:=x;
	while f[x]<>x do x:=f[x];
	while f[t]<>x do
		begin
			c:=f[t];
			f[t]:=x;
			t:=c;
		end;
end;
begin
	readln(t);
	for u:=1 to t do
		begin
			readln(n);ans:=0;
			for i:=1 to n do begin f[i]:=i;s[i]:=1;end;
			for i:=1 to n-1 do
				readln(a[i],b[i],e[i]);
			qsort(1,n-1);
			for i:=1 to n-1 do
				begin
					x:=find(a[i]);y:=find(b[i]);
					if x<>y then
						begin
							f[x]:=y;
							inc(ans,(s[x]*s[y]-1)*(e[i]+1));
							s[y]:=s[y]+s[x];
						end;
				end;
			writeln(ans);
		end;
end.

