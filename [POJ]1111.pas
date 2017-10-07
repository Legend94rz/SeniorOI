type
	node=record
		x,y:longint;
		end;
var
	ans,i,j:longint;
	n,m,x,y:longint;
	ch:array[0..100,0..100]of char;
	col:array[0..100,0..100]of longint;
	s:string;
procedure bfs(x,y:Longint);
var
	i:longint;
	q:array[0..10000]of node;
	l,r:longint;
	tx,ty:longint;
	vis:array[0..100,0..100]of boolean;
	dx:array[1..8]of longint=(-1,-1,0,1,1,1,0,-1);
	dy:array[1..8]of longint=(0,1,1,1,0,-1,-1,-1);
begin
	l:=0;r:=1;q[r].x:=x;q[r].y:=y;
	col[x,y]:=1;
	fillchar(vis,sizeof(vis),0);
	repeat
		inc(l);
		tx:=q[l].x;ty:=q[l].y;
		for i:=1 to 8 do
			if (ch[tx+dx[i],ty+dy[i]]='X')and(not vis[tx+dx[i],ty+dy[i]])and(tx+dx[i]>=1)and(tx+dx[i]<=n)and(ty+dy[i]>=1)and(ty+dy[i]<=m) then
				begin
					inc(r);
					q[r].x:=tx+dx[i];
					q[r].y:=ty+dy[i];
					vis[q[r].x,q[r].y]:=true;
					col[q[r].x,q[r].y]:=1;
				end;
	until l>=r;
end;
begin
	while true do
		begin
			readln(n,m,x,y);
			if (n=m)and(n=x)and(x=y)and(n=0) then break;
            ans:=0;
            fillchar(ch,sizeof(ch),' ');
            fillchar(col,sizeof(col),0);
			for i:=1 to n do
				begin
					readln(s);
					for j:=1 to length(s) do
						ch[i,j]:=s[j];
				end;
			bfs(x,y);
			//横向
			{for i:=1 to n do
				 begin
				 	  for j:=1 to m do
					  	  write(col[i,j]);
					  writeln;
				 end;}
			for i:=1 to n do
				for j:=1 to m do
					if col[i,j]=1 then
						begin
							if (j=1) then inc(ans);
							if (j=m) then inc(ans);
							if ch[i,j+1]='.' then inc(ans);
							if ch[i,j-1]='.' then inc(ans);
						end;
			//纵向
			for j:=1 to m do
				for i:=1 to n do
					if col[i,j]=1 then
						begin
							if (i=1) then inc(ans);
							if (i=n) then inc(ans);
							if ch[i-1,j]='.' then inc(ans);
							if ch[i+1,j]='.' then inc(ans);
						end;
			writeln(ans);
           end;
end.
