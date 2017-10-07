type
	node=record
		x,y:longint;
	end;
var
	dx:array[0..1,1..4]of longint=((-1,-1,1,1),(-1,-1,1,1));
	dy:array[0..1,1..4]of longint=((-1,0,0,-1),(0,1,1,0));
	i,j,n,m,time,max,count,sx,lx,ly:Longint;
	path:array[0..250,0..250,1..4]of boolean;
	ch:char;
	map,dep:array[0..250,0..250]of longint;
	num:array[0..7000]of longint;
	vis:array[0..250,0..250]of boolean;
	col:array[0..7000]of boolean;
	flag:boolean;
	pre:array[0..250,0..250]of node;
function maxx(a,b:Longint):Longint;
begin
	if a>b then exit(a);
	exit(b);
end;
procedure dfs(x,y,p:longint);
var
	i,j:longint;
begin
	map[x,y]:=time;
	for i:=1 to 4 do
		begin
			if (not vis[x+dx[x mod 2,i],y+dy[x mod 2,i]])and(path[x,y,i])and(x+dx[x mod 2,i]>=1)and(y+dy[x mod 2,i]>=1) then
				begin
					if odd(x+dx[x mod 2,i])and(y+dy[x mod 2,i]>=m)or(x+dx[x mod 2,i]>2*n-1) then continue;
					vis[x+dx[x mod 2,i],y+dy[x mod 2,i]]:=true;
					pre[x+dx[x mod 2,i],y+dy[x mod 2,i]].x:=x;
					pre[x+dx[x mod 2,i],y+dy[x mod 2,i]].y:=y;
					dep[x+dx[x mod 2,i],y+dy[x mod 2,i]]:=p+1;

					{if (time=7)and(path[x,y,i]) then
						writeln('Next vis: (',x+dx[x mod 2,i],',',y+dy[x mod 2,i],') VisSign: ',vis[x+dx[x mod 2,i],y+dy[x mod 2,i]],' from:(',x,',',y,'),PreXY: (',pre[x,y].x,',',pre[x,y].y,')');}
					
					dfs(x+dx[x mod 2,i],y+dy[x mod 2,i],p+1);
					vis[x+dx[x mod 2,i],y+dy[x mod 2,i]]:=false;
				end;
			{if (x=4)and(y=4)and(time=7)and(i=2)then
				writelN(x+dx[x mod 2,i],' ',pre[x,y].x,' ',y+dy[x mod 2,i],' ',pre[x,y].y,' ',path[x,y,i]);}
			if (vis[x+dx[x mod 2,i],y+dy[x mod 2,i]])and((x+dx[x mod 2,i]<>pre[x,y].x)or(y+dy[x mod 2,i]<>pre[x,y].y))and(path[x,y,i])then
				begin
					num[time]:=maxx(dep[x,y]-dep[x+dx[x mod 2,i],y+dy[x mod 2,i]]+1,num[time]);
					flag:=true;
					//writeln('color ',time,' will be a circle,occur at ',x,' ',y,' ',x+dx[x mod 2,i],' ',y+dy[x mod 2,i]);
				end;
		end;
end;
begin
	while true do
		begin
			readln(m,n);inc(sx);
			if (n=m) and(n=0) then break;
			fillchar(path,sizeof(path),1);
			fillchar(num,sizeof(num),0);
			fillchar(col,sizeof(col),0);
			fillchar(map,sizeof(map),0);
			fillchar(pre,sizeof(pre),0);
			fillchar(dep,sizeof(dep),0);
			for i:=1 to n do
				begin
					for j:=1 to m do
						begin
							read(ch);
							if ch='/' then
								begin
									path[2*i-2,j,3]:=false;
									path[2*i-1,j-1,3]:=false;
									path[2*i-1,j,1]:=false;
									path[2*i,j,1]:=false;
								end
							else
								begin
									path[2*i-1,j-1,2]:=false;
									path[2*i,j,2]:=false;
									path[2*i-2,j,4]:=false;
									path[2*i-1,j,4]:=false;
								end;
						end;
					readln;
				end;
			count:=0;time:=0;flag:=false;max:=0;
			for i:=1 to 2*n-1 do
				for j:=1 to m do
					if (map[i,j]=0)and(j<=m-j mod 2) then
						begin
							inc(time);flag:=false;lx:=i;lY:=j;
							fillchar(vis,sizeof(vis),0);
							vis[i,j]:=true;dep[i,j]:=1;
							dfs(i,j,1);
							if flag then
								begin
								col[time]:=true;inc(count);
								//writeln('color ',time,' is a circle');
								end;
						end;
            {for i:=1 to 2*n-1 do
				begin
					for j:=1 to m do
						if odd(i) then
							if j=m then continue else
								write(map[i,j]:3)
						else
							write(map[i,j],'  ');
					writeln;
                end;}
			//writeln('*test*',path[3,5,3],' ',path[4,6,1],' ',path[2,6,3],' ',path[3,6,1]);
			writeln('Maze #',sx,':');
			if (count=0) then begin writeln('There are no cycles.');writeln;continue;end;
			for I:=1 to time do
				if (num[i]>max)and(col[i]) then
					max:=num[i];
			writeln(count,' Cycles; the longest has length ',max,'.');
			writeln;
		end;
end.
