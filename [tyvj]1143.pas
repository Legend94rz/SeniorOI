type
	node=record
		x,y,dep:longint;
		usd:boolean;
	end;
var
	i,j,n,m:longint;
	ch:array[0..1001,0..1001]of char;
	q:array[0..100001]of node;
	l,r:longint;
	vis:array[0..1000,0..1000,false..true]of boolean;
	dx:array[1..4]of longint=(-1,0,1,0);
	dy:array[1..4]of longint=(0,1,0,-1);
	d:array[0..1001,0..1001,false..true]of longint;
procedure inq(x,y:longint);
begin
	inc(r);if r>=100000 then r:=1;
	q[r].dep:=q[l].dep+1;
	q[r].x:=x;q[r].y:=y;
end;
procedure spfa;
var
	i,k,tx,ty:longint;
begin
	fillchar(vis,sizeof(vis),0);l:=0;r:=1;
	q[r].x:=1;q[r].y:=1;fillchar(d,sizeof(d),$3f);d[1,1,false]:=0;
	repeat
		inc(l);if l>=100000 then l:=1;
		tx:=q[l].x;ty:=q[l].y;vis[tx,ty,q[l].usd]:=false;
		for k:=1 to 4 do
			if (tx+dx[k]>=1)and(tx+dx[k]<=n)and(ty+dy[k]>=1)and(ty+dy[k]<=m) then
				begin
					case ch[tx+dx[k],ty+dy[k]] of
						'*':if not q[l].usd then
								if d[tx,ty,false]+1<d[tx+dx[k],ty+dy[k],true] then
									begin
										d[tx+dx[k],ty+dy[k],true]:=d[tx,ty,false]+1;
										if not vis[tx+dx[k],ty+dy[k],true] then
											inq(tx+dx[k],ty+dy[k]);
										vis[tx+dx[k],ty+dy[k],true]:=true;
										q[r].usd:=true;
									end;
						'.':if d[tx,ty,q[l].usd]+1<d[tx+dx[k],ty+dy[k],q[l].usd] then
								begin
									d[tx+dx[k],ty+dy[k],q[l].usd]:=d[tx,ty,q[l].usd]+1;
									if not vis[tx+dx[k],ty+dy[k],q[l].usd] then
										inq(tx+dx[k],ty+dy[k]);
									vis[tx+dx[k],ty+dy[k],q[l].usd]:=true;
									q[r].usd:=q[l].usd;
								end;
						end;
					if (q[r].x=n)and(q[r].y=m) then begin writeln(q[r].dep);halt;end;
				end;
	until l=r;
end;
begin
	readln(n,m);
	for i:=1 to n do
		begin
			for j:=1 to m do
				read(ch[i,j]);
			readln;
		end;
	spfa;
	writeln('no');
end.

