type
	node=record
		x,y:longint;
		end;
var
	i,j,n,m,time:longint;
	sx,sy,tx,ty:longint;
	ch:array[0..51,0..51]of char;
	v:array[0..51,0..51]of boolean;
	q:array[0..10001]of node;
	d:array[0..51,0..51]of longint;
	dx:array[1..4]of longint=(1,0,-1,0);
	dy:array[1..4]of longint=(0,1,0,-1);
procedure bfs;
var
	l,r,t,i,fx,fy:longint;
	k:node;
begin
	l:=0;r:=1;q[r].x:=sx;q[r].y:=sy;
	fillchar(d,sizeof(d),$3f);d[sx,sy]:=0;v[sx,sy]:=true;
	repeat
		inc(l);if l>=10000 then l:=1;
		k:=q[l];v[k.x,k.y]:=false;
		for i:=1 to 4 do
			if (k.x+dx[i]<=n)and(k.x+dx[i]>=1)and(k.y+dy[i]<=m)and(k.y+dy[i]>=1)and(ch[k.x+dx[i],k.y+dy[i]]<>'o') then
				begin
					if ch[k.x,k.y]='#' then t:=2 else t:=1;
					fx:=k.x+dx[i];fy:=k.y+dy[i];
					if d[k.x,k.y]+t<d[fx,fy] then
						begin
							d[fx,fy]:=d[k.x,k.y]+t;
							if not v[fx,fy] then
								begin
									inc(r);if r>=10000 then r:=1;
									q[r].x:=fx;
                                    q[r].y:=fy;
									if (fx=tx)and(fy=ty) then break;
                                    v[fx,fy]:=true;
                                end;
						end;
                end;
	until l=r;
	{for i:=1 to n do
		begin
		for j:=1 to m do
			write(d[i,j]:9);
		writeln;
		end;}
  	if d[tx,ty]<time then
		writeln(d[tx,ty])
  	else
  		writeln('55555');
    close(output);halt;
end;
begin
	//assign(input,'save.in');reset(input);assign(output,'save.out');rewrite(output);
	readln(Time);
	readln(m);
	readln(n);
	for i:=1 to n do
		begin
		    for j:=1 to m do
				begin
	                read(ch[i,j]);
					if ch[i,j]='s' then begin sx:=i;sy:=j;end;
					if ch[i,j]='m' then begin tx:=i;ty:=j;end;
				end;
			readln;
		end;
	bfs;
end.

