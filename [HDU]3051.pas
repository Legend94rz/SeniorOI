program o;
const
	dx:array[1..4]of longint=(-1,0,1,0);
	dy:array[1..4]of longint=(0,1,0,-1);
type
	node=record
		x,y:longint
	End;
var
	i,j:longint;
	h,m,maxn,col:longint;
	ch:array[0..1001,0..1001]of char;
	vis:array[0..1001,0..1001]of boolean;
	q:array[0..1000000]of node;
	l,r:longint;
	f:array[0..1001,0..1001]of longint;
	cc:array[0..1000001]of longint;
procedure bfs(x,y:longint);
var
	i,kx,ky:longint;
begin
	l:=0;r:=1;q[r].x:=x;q[r].y:=y;
	repeat
		inc(l);
		kx:=q[l].x;ky:=q[l].y;
		for i:=1 to 4 do
			if (not vis[kx+dx[i],ky+dy[i]])and(kx+dx[i]<=m)and(kx+dx[i]>=1)and(ky+dy[i]<=h)and(ky+dy[i]>=1)and(ch[kx+dx[i],ky+dy[i]]='*') then
				begin
					f[kx+dx[i],ky+dy[i]]:=col;
					vis[kx+dx[i],ky+dy[i]]:=true;
					inc(r);
					q[r].x:=kx+dx[i];q[r].y:=ky+dy[i];
				End;
	Until l>=r;
end;
begin
	readln(h,m);
	for i:=1 to m do
		begin
		for j:=1 to h do
			read(ch[i,j]);
		readln;
		end;
	for i:=1 to m do
		for j:=1 to h do
			if (not vis[i,j])and(ch[i,j]='*') then
				begin
					inc(col);//writeln('will search ',i,' ',j);
					bfs(i,j);
				End;
	{for i:=1 to m do
		begin
		for j:=1 to h do
			write(f[i,j]:3);
		writeln;
		end;}
	for i:=1 to m do
		for j:=1 to h do
				inc(cc[f[i,j]]);
	for i:=1 to col do
		if cc[i]>maxn then maxn:=cc[i];
	writeln(maxn);
end.

