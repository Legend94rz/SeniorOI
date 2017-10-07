var
	i,j,n,m,x,y,z:longint;
	a,b,e,c,f:array[0..200001]of int64;
	mst:int64;
procedure qsort(s,t:Longint);
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
function min(a,b,c:longint):longint;
begin
	min:=a;
	if min>b then min:=b;
	if min>c then min:=c;
end;
function getf(x:longint):longint;
var
	c,t:Longint;
begin
	t:=x;
	while x<>f[x] do x:=f[x];
	while f[t]<>x do
		begin
			c:=f[t];
			f[t]:=x;
			t:=c;
		end;
	exit(x);
end;
begin
	assign(input,'cheer.in');reset(input);assign(output,'cheer.out');rewrite(output);
	readln(n,m);
	for i:=1 to n do begin readln(c[i]);f[i]:=i;end;
	for i:=1 to m do begin readln(a[i],b[i],e[i]);e[i]:=2*e[i]+c[a[i]]+c[b[i]];end;
	qsort(1,m);z:=$3f3f3f3f;
	for i:=1 to m do
		begin
			x:=getf(a[i]);y:=getf(b[i]);
			writeln(i,' ',a[i],' ',b[i],' ',e[i]);
			if x<>y then
				begin
					z:=min(z,c[a[i]],c[b[i]]);
					f[x]:=y;
					inc(mst,e[i]);
                end;
		end;
	writeln(mst+z);
	close(output);
end.

