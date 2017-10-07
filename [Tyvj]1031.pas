var
	a,b,w,f:array[0..7000]of longint;
	d,q:array[0..100000]of longint;
	i,n,l,r:longint;
	Ts, Te,m:longint;
	vis:array[0..7000]of boolean;
procedure qsort(s,t:longint);
var
	i,j,k,y:longint;
begin
	i:=s;j:=t;k:=a[random(t-s+1)+s];
	repeat
		while a[j]>k do dec(j);
		while a[i]<k do inc(i);
		if i<=j then begin
			y:=a[i];a[i]:=a[j];a[j]:=y;
			y:=b[i];b[i]:=b[j];b[j]:=y;
			y:=w[i];w[i]:=w[j];w[j]:=y;
			inc(i);dec(j);
		end;
	until i>=j;
	if (s<j)then qsort(s,j);
	if (i<t)then qsort(i,t);
end;
procedure spfa(s:longint);
var
	k:longint;
begin
	fillchar(vis,sizeof(vis),0);
	for i:=1 to n do
		d[i]:=$3f3f3f3f;
	d[s]:=0;l:=0;
	r:=1;q[1]:=s;vis[s]:=true;
	repeat
		l:=l+1;
		k:=q[l];
		for i:=f[k] to f[k+1]-1 do
			if d[k]+w[i]<d[b[i]] then
				begin
					d[b[i]]:=d[k]+w[i];
					if not vis[b[i]] then
						begin
							r:=r+1;
							q[r]:=b[i];
							vis[b[i]]:=true;
						end;
				end;
		vis[k]:=false;
	until l=r;
end;
begin
	readLN(n,m,Ts,Te);
	for i:=1 to m do
		readLN(a[i],b[i],w[i]);
	for i:=1 to m do
		begin
			a[i+m]:=b[i];
			b[i+m]:=a[i];
			w[i+m]:=w[i];
		end;
	m:=m+m;
	randomize;
	qsort(1,m);
	for i:=1 to m do
		if f[a[i]]=0 then f[a[i]]:=i;
	f[n+1]:=m+1;
	for i:=n downto 1 do
		if f[i]=0 then f[i]:=f[i+1];
	spfa(ts);
	writeln(d[te]);
end.
