var
	max,min,i,j,n,m,x,y,ans:longint;
	a,b,e:array[0..2000000]of longint;
	f:array[0..200000]of longint;
function getf(x:longint):longint;
var
	c,t:longint;
begin
	c:=x;
	while f[x]<>x do x:=f[x];
	while c<>x do
		begin
			t:=f[c];
			f[c]:=x;
			c:=t;
        end;
	exit(x);
end;
procedure getmst(k:longint);
var
	i:longint;
	sum:longint;
begin
	sum:=0;
	for i:=k to m do
			begin
				x:=getf(a[i]);y:=getf(b[i]);
				if x<>y then
					begin
						f[x]:=y;inc(sum);
						if e[i]>max then max:=e[i];
						if e[i]<min then min:=e[i];
					end;
        	end;
	if sum<>n-1 then exit;
	if max-min<ans then ans:=max-min;
end;
procedure qsort(s,t:longint);
var
	i,j,k,u:longint;
begin
	i:=s;j:=t;k:=e[(s+t) shr 1];
	repeat
		while e[j]>k do dec(j);
		while e[i]<k do inc(i);
		if i<=j then
			begin
				u:=a[i];a[i]:=a[j];a[j]:=u;
				u:=b[i];b[i]:=b[j];b[j]:=u;
				u:=e[i];e[i]:=e[j];e[j]:=u;
				inc(i);dec(j);
            end;
	until i>=j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
begin
	while true do
    begin
		readln(n,m);//注意无解!
		if (n=0)and(m=0) then exit;
		for i:=1 to m do readln(a[i],b[i],e[i]);
		qsort(1,m);
		ans:=maxlongint;
		for i:=1 to m-n+2 do
			begin
				for j:=1 to n do f[j]:=j;min:=maxlongint;max:=-1;
				getmst(i);
     	   end;
		if ans<>maxlongint then
			writeln(ans)
		else
			writeln(-1);
	end;
end.

