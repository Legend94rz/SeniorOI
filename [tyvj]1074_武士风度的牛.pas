const
	dx:array[1..8]of longint=(-1,-2,-2,-1,1,2,1,2);
	dy:array[1..8]of longint=(-2,-1,1,2,2,1,-2,-1);
type
	node=record
		x,y,d:longint;
		end;
var
	i,j,n,m:longint;
	ch:array[0..201,0..201]of char;
	sx,sy,tx,ty:longint;
	v:array[0..201,0..201]of boolean;
procedure bfs;
var
	i:longint;
	q:array[0..10001]of node;
	l,r:longint;
	fx,fy:longint;
begin
	r:=1;l:=0;q[r].x:=sx;q[r].y:=sy;q[r].d:=0;v[sx,sy]:=true;
	repeat
		inc(l);if l>=10000 then l:=1;
		for i:=1 to 8 do
			begin
				fx:=q[l].x+dx[i];fy:=q[l].y+dy[i];
				if (fx>=1)and(fx<=n)and(fy>=1)and(fy<=m)and(not v[fx,fy])and(ch[fx,fy]<>'*') then
					begin
						inc(r);if r>=10000 then r:=1;
						q[r].x:=fx;q[r].y:=fy;q[r].d:=q[l].d+1;
						v[fx,fy]:=true;
						if (ch[fx,fy]='H') then begin writeln(q[r].d);halt;end;
					end;
            end;
	until l=r;
end;
begin
	readln(m,n);
	for i:=1 to n do
		begin
			for j:=1 to m do
				begin
					read(ch[i,j]);
					if ch[i,j]='K' then begin sx:=i;sy:=j;end;
				end;
			readln;
        end;
	bfs;
end.

