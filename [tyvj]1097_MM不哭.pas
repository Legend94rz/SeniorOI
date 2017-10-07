var
	k,i,j,n,m:longint;
	f1,f2:array[0..1501,0..1501]of longint;
	s,x,w:array[0..1501]of longint;
procedure qsort(s,t:longint);
var
	i,j,k,u:longint;
begin
	i:=s;j:=t;k:=x[(s+t)shr 1];
	repeat
		while (x[j]>k) do dec(j);
		while (x[i]<k) do inc(i);
		if i<=j then
			begin
				u:=x[i];x[i]:=x[j];x[j]:=u;
				u:=w[i];w[i]:=w[j];w[j]:=u;
				inc(i);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
begin
	readln(n);
	readln(k);
	for i:=1 to n do begin readln(x[i],w[i]);s[i]:=s[i-1]+w[i];end;
	qsort(1,n);
	fillchar(f1,sizeof(f1),$3f);fillchar(f2,sizeof(f2),$3f);
	f1[k,k]:=0;f2[k,k]:=0;
	for i:=k downto 1 do
		for j:=k to n do
			if i<>j then
				begin
					f1[i,j]:=min(
                    		f1[i+1,j]+(x[i+1]-x[i])*(s[n]-s[j]+s[i]),
							f2[i+1,j]+(x[j]-x[i])*(s[n]-s[j]+s[i]));
					f2[i,j]:=min(
							f2[i,j-1]+(x[j]-x[j-1])*(s[n]-s[j-1]+s[i-1]),
							f1[i,j-1]+(x[j]-x[i])*(s[n]-s[j-1]+s[i-1]));
	            end;
	writeln(min(f1[1,n],f2[1,n]));
end.

