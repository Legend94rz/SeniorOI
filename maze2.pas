type
	node=record
		x,y,d:longint;
		end;
var
	i,j,n,m,c,l,r:longint;
	x,Y:longint;
	q:array[0..1000000]of node;
	max,min,mid:longint;
	b:array[0..1005,0..1005]of boolean;
	dx:array[1..4]of longint=(0,1,-1,0);
	dy:array[1..4]of longint=(1,0,0,-1);
	a:array[0..1005,0..1005]of longint;
function check(x,y:longint):boolean;
var
	i,j:longint;
begin
	for I:=1 to r do
		if abs(x-q[i].x)+abs(y-q[i].y)<mid then
			exit(true);
	exit(false);
end;
procedure ext;
var
	i,j,k,c,d:longint;
	u:array[0..1000005]of node;
	v:array[0..1005,0..1005] of boolean;
	h,t:longint;
begin
	h:=0;t:=0;
	for i:=1 to r do
		begin
			inc(t);
			u[t].x:=q[i].x;
			u[t].y:=q[i].y;
			u[t].d:=0;
			v[q[i].x,q[i].y]:=true;
			a[q[i].x,q[i].y]:=0;
		end;
	fillchar(v,sizeof(v),0);
	repeat
		inc(h);
		c:=u[h].x;d:=u[h].y;
		for i:=1 to 4 do
			if (not v[c+dx[i],d+dy[i]])and(c>1)and(c<n)and(d>1)and(d<m) then
				begin
					inc(t);
					u[t].x:=c+dx[i];u[t].y:=d+dy[i];
					v[c+dx[i],d+dy[i]]:=true;u[t].d:=u[h].d+1;
					if u[t].d<a[c+dx[i],d+dy[i]] then a[c+dx[i],d+dy[i]]:=u[t].d;
				end;
	until h>=t;
end;
function bfs:boolean;
var
	i,j:longint;
	u:array[0..1000000]of node;
	v:array[0..1005,0..1005] of boolean;
	h,t:longint;
	c,d:longint;
begin
	u[1].x:=1;u[1].y:=1;
	h:=0;t:=1;v[1,1]:=true;
	fillchar(v,sizeof(v),0);
	repeat
		inc(h);
		c:=u[h].x;d:=u[h].y;
		for I:=1 to 2 do
			if (not v[c+dx[i],d+dy[i]])and(a[c+dx[i],d+dy[i]]>=mid)and(c+dx[i]>=1)and(c+dx[i]<=n)and(d+dy[i]>=1)and(d+dy[i]<=m) then
				begin
					inc(t);
					u[t].x:=c+dx[i];u[t].y:=d+dy[i];
					v[c+dx[i],d+dy[i]]:=true;
					if (c+dx[i]=n)and(d+dy[i]=m) then exit(true);
				end;
	until h>=t;
	exit(false);
end;
begin
	assign(output,'maze2.out');rewrite(output);
	assign(input,'maze2.in');reset(input);
	readln(n,m,c);
	if c=n*m then begin
		writelN(0);
		close(output);
		halt;
	end;
	for i:=1 to c do
		begin
			inc(r);
			readln(q[r].x,q[r].y);
		end;
	fillchar(a,sizeof(a),$3f);
	ext;
	max:=n+m+2;
	min:=0;
	while max>=min do
		begin
			mid:=(min+max) shr 1;
			if bfs then
				min:=mid+1
			else
				max:=mid-1;
		end;
	writelN(max);
	close(input);close(output);
end.
