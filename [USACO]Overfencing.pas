{
id:rz109291
PROG:maze1
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: maze1
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 1980 KB]
   Test 2: TEST OK [0.000 secs, 1980 KB]
   Test 3: TEST OK [0.000 secs, 1980 KB]
   Test 4: TEST OK [0.000 secs, 1980 KB]
   Test 5: TEST OK [0.000 secs, 1980 KB]
   Test 6: TEST OK [0.000 secs, 1980 KB]
   Test 7: TEST OK [0.000 secs, 1980 KB]
   Test 8: TEST OK [0.000 secs, 1980 KB]
   Test 9: TEST OK [0.000 secs, 1980 KB]
   Test 10: TEST OK [0.000 secs, 1980 KB]

All tests OK.
Your program ('maze1') produced all correct answers!  This is your
submission #7 for this problem.  Congratulations!
}
const
	dx:array[1..4]of longint=(-2,0,2,0);
	dy:array[1..4]of longint=(0,2,0,-2);
	vx:array[1..4]of longint=(-1,0,1,0);
	vy:array[1..4]of longint=(0,1,0,-1);
type
	node=record
		x,y,dep:longint;
		end;
var
	ch:array[0..300,0..300]of char;
	i,j,x,y,w,h,l,r,p,k:longint;
	ex,ey:array[1..2]of longint;
	s:string;
	b:array[0..302,0..300]of boolean;
	q:array[0..100000]of node;
	min:array[0..302,0..300]of longint;
begin
	assign(input,'maze1.in');reset(input);assign(output,'maze1.out');rewrite(output);
	readln(w,h);
	w:=2*w+1;
	h:=2*h+1;
	for i:=1 to h do
		begin
		readln(s);
		for j:=1 to length(s) do
			begin
			ch[i,j]:=s[j];
			if ((((i=1)or (i=h))and(not odd(j)))and(s[j]=' '))or((((j=1)or(j=w))and(not odd(i)))and(s[j]=' ')) then
				begin
					inc(l);
					ex[l]:=i;ey[l]:=j;
				end;
			end;
		end;
	//writeln(ex[1],' ',ey[1]);
	//writeln(ex[2],' ',ey[2]);
	//writeln(w,' ',h);
	fillchar(min,sizeof(min),$3f);
	for p:=1 to 2 do
		begin
			l:=0;r:=1;
			q[r].x:=ex[p];q[r].y:=ey[p];
			if (ex[p]=h) then dec(q[r].x);
			if (ex[p]=1) then inc(q[r].x);
			if (ey[p]=1) then inc(q[r].y);
			if (ey[p]=w) then dec(q[r].y);
			//writeln(q[r].x,' ',q[r].y);
			q[r].dep:=1;
			fillchar(b,sizeof(b),0);
			repeat
				inc(l);
				x:=q[l].x;y:=q[l].y;
				for i:=1 to 4 do
					begin
						if (ch[x+vx[i],y+vy[i]]=' ')
						and(not b[x+dx[i],y+dy[i]])
						and(x+dx[i]<=h)
						and(x+dx[i]>=1)
						and(y+dy[i]>=1)
						and(y+dy[i]<=w)then
							begin
								inc(r);
								//if r>=100000 then writeln('!!!!!!!!!!!!!!!!!!!!') ;
								q[r].x:=x+dx[i];
								q[r].y:=y+dy[i];
								q[r].dep:=q[l].dep+1;
								b[x+dx[i],y+dy[i]]:=true;
								if q[r].dep<min[q[r].x,q[r].y] then
									min[q[r].x,q[r].y]:=q[r].dep;
							end;
					end;
			until l>=r;
		end;
        min[0,0]:=0;
	{i:=2;j:=2;
	while i<=w do
		begin
		while j<=h do
			begin
				if(min[i,j]>min[0,0])and(min[i,j]<>$3f3f3f3f) then
					min[0,0]:=min[i,j];
				inc(j,2);
			end;
		inc(i,2);j:=2;
		end;
	找最大值？暴力的扫一遍吧，在你以为很慢的情况下，程序依然进行的毫无压力！！
	在不知道标准结果之前谁都不能说他会超时，这样总比得到一个错误的答案要好！！
	}
	for i:=1 to h do
		for j:=1 to w do
			if (min[i,j]<>$3f3f3f3f) and(min[i,j]>min[0,0])then
				min[0,0]:=min[i,j];
	if min[0,0]=0 then min[0,0]:=1;
	writeln(min[0,0]);
	{for i:=1 to h do
		begin
		for j:=1 to w do
			if min[i,j]=$3f3f3f3f then write('+':4)
			else
				write(min[i,j]:4);
		writeln;
		end;}
	close(input);close(output);
end.
