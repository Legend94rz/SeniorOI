type
	node=record
		x,y:real;
		end;
var
	i,j:longint;
	k,b:array[0..200]of longint;
	n,ans,r:longint;	
	q:array[0..10005]of node;
operator < (a,b:node)ans:boolean;
begin
	if (a.x=b.x)and(a.y=b.y)then exit(false);
	exit(true);
end;
procedure qsort(s,t:longint);
var
	i,j:Longint;
	k:real;
	y:node;
begin
	i:=s;j:=t;k:=q[(s+t)shr 1].x;
	repeat
		while q[j].x>k do dec(j);
		while q[i].x<k do inc(i);
		if i<=j then begin
			y:=q[i];q[i]:=q[j];q[j]:=y;
			inc(i);dec(j);
		end;
	until i>=j;
	if(i<t) then qsort(i,t);
	if (s<j) then qsort(s,j);
end;
begin
	readln(n);
	for i:=1 to n do
		readln(k[i],b[i]);
	for i:=1 to n-1 do
		for j:=i+1 to n do
			begin
				if k[i]=k[j] then continue;
				inc(r);
				q[r].x:=(b[j]-b[i])/(k[i]-k[j]);
				q[r].y:=q[r].x*k[i]+b[i];
			end;
	qsort(1,r);
	for i:=2 to r do
		if q[i]<q[i-1] then
			inc(ans);
        if r>0 then
			writeln(ans+1)
        else
			writeln('No Fire Point.');
end.
