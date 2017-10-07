type
	node=record
		x,y,dp:longint;
		end;
var
	q:array[0..5001]of node;
	temp:node;
	l,r,i,j:longint;
	x,y:array[1..2]of longint;
	a1,y1,x2,y2:longint;
	dx:array[1..12]of longint=(-1,-2,-2,  2,2,1  ,-2,-2,-1  ,1,2,2);
	dy:array[1..12]of longint=(-2,-1,-2, -1,-2,-2,  1,2,2,   2,2,1);
	fnd:boolean;
function dupe :boolean;
var
	k:longint;
begin
	for k:=1 to r-1 do
		if (q[k].x=q[r].x)and(q[k].y=q[r].y)then
			exit(true);
	exit(false);
end;
begin
	readln(x[1],y[1]);
	readln(x[2],y[2]);
	for I:=1 to 2 do
	begin
		q[1].x:=x[i];r:=1;l:=0;
		q[1].y:=y[i];
		q[1].dp:=0;
		fnd:=false;
		repeat
			inc(l);
			temp:=q[l];
			for j:=1 to 12 do
				if (temp.x+dx[j]>=1) and(temp.y+dy[j]>=1)and(temp.x+dx[j]<=19)and(temp.y+dy[j]<=19)then
					begin
						inc(r);
						//writeln(l,' ',r);
						q[r].x:=temp.x+dx[j];
						q[r].y:=temp.y+dy[j];
						q[r].dp:=q[l].dp+1;
						if dupe then dec(r);
						if (q[r].x=1)and(q[r].y=1)then
							begin
                                                                writeln(q[r].dp);
								fnd:=true;
								break;
							end;
					end;
			if fnd then break;
		until l=r;
	end;
end.
