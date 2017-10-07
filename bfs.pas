type
	QDataType=record
			X,Y,d:longint;
			end;
var
	q:array[0..20000]of QDataType;
	x,y,i,j,l,r,days,mx,my,tx,ty,td:longint;
	s:string;
	b:array[0..101,0..101]of boolean;
	dx:array[1..8]of longint=(0,1,1,1,0,-1,-1,-1);
	dy:array[1..8]of longint=(1,1,0,-1,-1,-1,0,1);
begin
	readln(x,y,mx,my);
	for i:=y downto 1 do
		begin
			readln(s);
			for j:=1 to length(s) do
				if(s[j]='*')or(s[j]='M')then b[j,i]:=true;
		end;
	q[1].x:=mx;q[1].y:=my;q[1].d:=0;
	l:=0;r:=1;
	repeat
		inc(l);
		tx:=q[l].x;ty:=q[l].y;td:=q[l].d;
		for i:=1 to 8 do
			if(tx+dx[i]>x)or(tx+dx[i]<1)or(ty+dy[i]>y)or(ty+dy[i]<1)or(b[tx+dx[i],ty+dy[i]]=true)then
				continue
			else
				begin
					b[tx+dx[i],ty+dy[i]]:=true;
					inc(r);
					q[r].d:=td+1;
					q[r].x:=tx+dx[i];
					q[r].y:=ty+dy[i];
				end;
		//inc(days);
	until l>=r;
	writeln(q[l].d);
end.
