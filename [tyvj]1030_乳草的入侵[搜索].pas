type
	node=record
		x,y,d:Longint;
		end;
var
	i,j,n,m,sx,sy:longint;
	a:array[0..151,0..151]of char;
	{dx:array[1..8]of longint=(-1,0,1,0,-1,-1,1,1);
	dy:ARRAY[1..8]of longint=(0,1,0,-1,-1,1,-1,1);}
    dx:array[1..8] of longint=(1,1,0,-1,-1,-1,0,1);
    dy:array[1..8] of longint=(0,1,1,1,0,-1,-1,-1);
procedure bfs;
var
	q:array[0..100001]of node;
	t:node;
	l,r,i,j:longint;
begin
	l:=0;r:=1;q[r].x:=sx;q[r].y:=sy;q[r].d:=0;
	a[sx,sy]:='M';
	repeat
		inc(l);if l>=100000 then l:=1;
		for i:=1 to 8 do
			begin
				t.x:=q[l].x+dx[i];
				t.y:=q[l].y+dy[i];
				if (t.x>=1)and(t.x<=n)and(t.y>=1)and(t.y<=M)and(a[t.x,t.y]='.') then
					begin
						inc(r);if r>=100000 then r:=1;
						q[r].x:=t.x;q[r].y:=t.y;
                        q[r].d:=q[l].d+1;
						a[t.x,t.y]:='M';
					end;
            end;
        {writeln(l,'----------',r,'(',q[l].x,',',q[l].y,')',q[l].d);
		for i:=n downto 1 do
			begin
				for j:=1 to m do write(a[i,j]);
				writeln;
			end;}
	until l=r;
	writeln(q[r].d);
end;
begin
	//assign(output,'t.txt');rewrite(output);
	readln(m,n,sy,sx);
	for i:=n downto 1 do
		begin
			for j:=1 to m do read(a[i,j]);
			readln;
		end;
	bfs;
	close(output);
end.

