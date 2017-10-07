var
	f,a,b,e,d:array[0..1000]of longint;
	q:array[0..3500]of longint;
	i,j,k,n,m,x,y,tot,l,r,max:longint;
	vis:array[0..5000]of boolean;
procedure qsort(s,t:longint);
var
	k,i,j,y:longint;
begin
	i:=s;j:=t;k:=a[s];
	repeat
		while a[j]>k do dec(j);
		while a[i]<k do inc(i);
		if i<=j then begin
		y:=a[i];a[i]:=a[j];a[j]:=y;
		y:=b[i];b[i]:=b[j];b[j]:=y;
                inc(i);dec(j);
		end;
	until i>=j;
	if (i<t)then qsort(i,t);
	if (s<j)then qsort(s,j);
end;
procedure spfa(s:longint);
var
	k,i:longint;
begin
	fillchar(d,sizeof(d),$3f);
	fillchar(vis,sizeof(vis),0);
	d[s]:=0;
	r:=1;
	l:=0;
	q[r]:=s;
	vis[s]:=true;
	repeat
		inc(l);
		k:=q[l];
		for i:=f[k] to f[k+1]-1 do
			begin
			if d[k]+e[i]<=d[b[i]] then
				begin
				d[b[i]]:=d[k]+e[i];
				if not vis[b[i]] then
					begin
					inc(r);
					q[r]:=b[i];
					vis[b[i]]:=true;
					end;
				end;
					vis[k]:=false;
			end;
	until l=r;
end;
begin
	readln(n,m);
	for i:=1 to m do
	begin
		readln(x,y);
		inc(tot);
		a[tot]:=x;
		b[tot]:=y;
		e[tot]:=1;
		inc(tot);
		a[tot]:=y;
		b[tot]:=x;
		e[tot]:=1;
	end;
	m:=m+m;
	qsort(1,tot);
	for i:=1 to m do
		if f[a[i]]=0 then
			f[a[i]]:=i;
	f[n+1]:=m+1;
	for i:=n downto 1 do
		if f[i]=0 then
			f[i]:=f[i+1];
	max:=-100000;
	for i:=1 to n do
		begin
		spfa(i);
		for j:=1 to n do
			if d[j]>max then max:=d[j];
		end;
	writeln(max);
end.
