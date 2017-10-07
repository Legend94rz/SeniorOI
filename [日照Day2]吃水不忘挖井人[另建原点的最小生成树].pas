var
	i,j,n,m,k:longint;
	x,y,z:longint;
	cost,a,b,e,f:array[0..200001]of longint;
	ans:int64;
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
procedure qsort(s,t:longint);
var
	i,j,k,u:longint;
begin
	i:=s;j:=t;k:=e[(s+t)shr 1];
	repeat
		while e[j]>k do dec(j);
		while e[i]<k do inc(i);
		if i<=j then
			begin
				u:=a[i];a[i]:=a[j];a[j]:=u;
				u:=b[i];b[i]:=b[j];b[j]:=u;
				u:=e[i];e[i]:=e[j];e[j]:=u;
				inc(i);dec(J);
            end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
begin
	assign(input,'well.in');reset(input);assign(output,'well.out');rewrite(output);
	read(n);
	for i:=1 to n do
		read(cost[i]);
	read(k);
	for i:=1 to k do
		begin
			read(x,y,z);
			inc(m);
			a[m]:=x;b[m]:=y;e[m]:=z;
        end;
	for i:=1 to n do
		if cost[i]<>-1 then
			begin
				inc(m);
				a[m]:=N+1;b[m]:=i;e[m]:=cost[i];
        	end;
	qsort(1,m);
//	for i:=1 to m do writeln('>',e[i]);
	for i:=1 to n+10 do f[i]:=i;
	for i:=1 to m do
		begin
			x:=getf(a[i]);y:=getf(b[i]);
			if x<>y then
				begin
					ans:=ans+e[i];
					f[y]:=x;
                end;
        end;
	writeln(ans);
	close(output);
end.
