type
	node=record
		x,y:longint;
		end;
var
	i,j,n,m,k:longint;
	ans:longint;
	ch:array[0..1001,0..1001]of char;
	c:array[0..1001,0..1001]of longint;
	color:longint;
	dx:array[1..8]of longint=(-1,0,1,0,-1,1,1,-1);
	dy:array[1..8]of longint=(0,1,0,-1,1,1,-1,-1);
	q:array[0..100001]of node;
	l,r:longint;
	vis:array[0..1001,0..1001]of boolean;
procedure bfs(x,y:longint);
var
	i:longint;
	tx,ty:longint;
begin
	l:=0;r:=1;q[r].x:=x;q[r].y:=y;
	repeat
		inc(l);if l>=100000 then l:=1;
		tx:=q[l].x;ty:=q[l].y;
		for i:=1 to 8 do
			if (ch[tx+dx[i],ty+dy[i]]<>'*')and(tx+dx[i]<=n)and(tx+dx[i]>=1)and(ty+dy[i]<=m)and(ty+dy[i]>=1)and(not vis[tx+dx[i],ty+dy[i]]) then
				begin
					c[tx+dx[i],ty+dy[i]]:=color;
					if ch[tx+dx[i],ty+dy[i]]='0' then
						begin
							inc(r);if r>=100000 then r:=1;
							q[r].x:=tx+dx[i];
							q[r].y:=ty+dy[i];
						end;
					vis[tx+dx[i],ty+dy[i]]:=true;
				end;
	until l=r;
end;
procedure count(x,y:longint);
var
	i:longint;
	c:longint;
begin
	c:=0;
	for i:=1 to 8 do
		if ch[x+dx[i],y+dy[i]]='*' then
			inc(c);
	ch[x,y]:=chr(c+48);
end;
begin
	readln(n,m);
	for i:=1 to n do
		begin
			for j:=1 to m do
				read(ch[i,j]);
			readln;
		end;
	for i:=1 to n do
		for j:=1 to m do
			if ch[i,j]<>'*' then
				count(i,j);
	{for i:=1 to n do
		begin
			for j:=1 to m do
				write(ch[i,j]);
			writeln;
		end;}
	for i:=1 to n do
		for j:=1 to m do
			if (ch[i,j]='0')and(c[i,j]=0)and(ch[i,j]<>'*') then
				begin
					inc(color);
					//writeln('will ex (',i,',',j,') color:',color);
					bfs(i,j);
				end;
	//writeln('half:',color);
	for i:=1 to n do
		begin
			for j:=1 to m do
				begin
					if (ch[i,j]in['1'..'9'])and(c[i,j]=0) then begin inc(color);c[i,j]:=color;end;
					//write(c[i,j]:3);
				end;
			//writeln;
		end;
	writeln(color);
end.

