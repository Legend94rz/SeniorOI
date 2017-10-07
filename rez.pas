var
	l,r:array[0..10000]of longint;
	f:array[0..300200]of longint;
	n,i,j,max:longint;
procedure qsort(s,t:longint);
var
	k,i,j,y:longint;
begin
	k:=l[random(t-s+1)+s];i:=s;j:=t;
	repeat
		while (l[j]>k)do dec(j);
		while (l[i]<k)do inc(i);
		if(i<=j)then
			begin
			y:=l[i];l[i]:=l[j];l[j]:=y;
			y:=r[i];r[i]:=r[j];r[j]:=y;
			dec(j);inc(i);
			end;
	until i>=j;
	if(i<t)then qsort(i,t);
	if(s<j)then qsort(s,j);
end;
begin
	readlN(n);
	for I:=1 to n do
		readln(l[i],r[i]);
	qsort(1,n);
	fillchar(f,sizeof(f),0);
	for i:=1 to n do
		for j:=0 to i-1 do
			if( f[j]+r[i]-l[i]>f[i] )and(r[j]<=l[i])then
				f[i]:=f[j]+r[i]-l[i];
	max:=f[1];
	for i:=1 to n do
		if(f[i]>max)then max:=f[i];
	writeln(max);
end.
