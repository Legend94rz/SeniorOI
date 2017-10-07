uses math;
var
	i,j,n,w:longint;
	a:array[0..1000001]of longint;
 	l,r,mid,t,ans,m:longint;
	count:longint;
	app:array[0..2000001]of longint;
begin
	readln(n,w);
	for i:=1 to n do read(a[i]);
	for i:=1 to w do
		begin
			inc(app[a[i]]);
			if app[a[i]]=1 then
				inc(count);
		end;
	ans:=count;
	for i:=w+1 to n do
		begin
			inc(app[a[i]]);
			if app[a[i]]=1 then inc(count);
			dec(app[a[i-w]]);
			if app[a[i-w]]=0 then dec(count);
			if count>ans then ans:=count;
		end;
	i:=0;j:=0;count:=0;fillchar(app,sizeof(app),0);m:=$3f3f3f3f;
	while (j<n)and(i<n) do
		begin
			while (count<ans)and(j<n) do
				begin
					inc(j);
					inc(app[a[j]]);
					if app[a[j]]=1 then inc(count);
				end;
			while (count=ans)and(j>i) do
				begin
					inc(i);
					dec(app[a[i]]);
					if app[a[i]]=0 then dec(count);
				end;
			if j-i+1<m then m:=j-i+1;
		end;
	writeln(ans,' ',m);
end.

