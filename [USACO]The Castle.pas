{
id:rz109291
LANG:PASCAL
PROG:castle
}
{
USER: r z [rz109291]
TASK: castle
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 4268 KB]
   Test 2: TEST OK [0.000 secs, 4268 KB]
   Test 3: TEST OK [0.000 secs, 4268 KB]
   Test 4: TEST OK [0.000 secs, 4268 KB]
   Test 5: TEST OK [0.000 secs, 4268 KB]
   Test 6: TEST OK [0.000 secs, 4268 KB]
   Test 7: TEST OK [0.000 secs, 4268 KB]
   Test 8: TEST OK [0.000 secs, 4268 KB]

All tests OK.
Your program ('castle') produced all correct answers!  This is your
submission #4 for this problem.  Congratulations!
}
type
	node=record
	x,y:longint;
	end;
var
	i,j,n,m,t,k,color,curm,big,x,y:longint;
	b:array[0..51,0..51,0..5]Of boolean;
	g,num:array[0..51,0..51]of longint;
	dx:array[1..4]of longint=(-1,0,1,0);
	dy:array[1..4]of longint=(0,1,0,-1);
	c:array[1..4]of char=('N','E','E','N');
	ct:char;
	q:array[0..2501,0..201]of node;
	ta:array[0..2501]of longint;
function max(a,b,c:longint):longint;
begin
	max:=a;
	if max<b then max:=b;
	if max<c then max:=c;
	//if max=0 then exit(1);
end;
procedure dfs(i,j:longint);
var
	l,p:longint;
begin
	//writeln(i,' ',j);
	//inc(room);
	if (i>n)or(i<1)or(j>m)or(j<1) then exit;
	g[i,j]:=color;
	//num[i,j]:=room;
	for l:=1 to 4 do
		begin
			//num[i,j]:=1;
			if (not b[i,j,l]) then
			begin
				if (g[i+dx[l],j+dy[l]]=-1) then begin
					g[i+dx[l],j+dy[l]]:=color;
					dfs(i+dx[l],j+dy[l]);
				end;
				//num[i,j]:=max(num[i+dx[l],j+dy[l]],room,num[i,j]);
				//if num[i,j]>big then big:=num[i,j];
			end;
	end;
	//if num[i,j]>big then big:=num[i,j];
end;
begin
	assign(input,'castle.in');reset(input);assign(output,'castle.out');rewrite(output);
	readln(m,n);
	big:=0;
	color:=0;
	curm:=0;
	for i:=1 to n do
		for j:=1 to m do
			begin
				read(t);
				if t>=8 then begin dec(t,8);b[i,j,3]:=true;end;//南
				if t>=4 then begin dec(t,4);b[i,j,2]:=true;end;//东
				if t>=2 then begin dec(t,2);b[i,j,1]:=true;end;//北
				if t>=1 then begin dec(t,1);b[i,j,4]:=true;end;//西
			end;
	for i:=0 to n+1 do
		for j:=0 to m+1 do
			g[i,j]:=-1;
	for i:=1 to n do
		for j:=1 to m do
			if (g[i,j]=-1) then
				begin
					inc(color);
					//room:=0;
					dfs(i,j);
				end;
	for i:=1 to n do
		for j:=1 to m do
			begin
				inc(ta[g[i,j]]);//把第i种颜色的队尾指针加一
				q[g[i,j],ta[g[i,j]]].x:=i;
				q[g[i,j],ta[g[i,j]]].y:=j;
				if ta[g[i,j]]>big then
					big:=ta[g[i,j]];
			end;
	for i:=1 to color do
		for j:=1 to ta[i] do
			num[q[i,j].x,q[i,j].y]:=ta[i];//第i个队列的第j个元素=第i种颜色的队尾
	for j:=1 to m do
		for i:=n downto 1 do
			for k:=1 to 4 do
				if (b[i,j,k])and(g[i,j]<>g[i+dx[k],j+dy[k]])and(num[i,j]+num[i+dx[k],j+dy[k]]>curm) then
					begin
						curm:=num[i,j]+num[i+dx[k],j+dy[k]];
						x:=i;
						y:=j;
						ct:=c[k];
					end;
	{for i:=1 to n do
		begin
			for j:=1 to m do
				write(g[i,j]:3);
			writeln;
		end;}
	writeln(color);
	writeln(big);
	writeln(curm);
	writeln(x,' ',y,' ',ct);
	{for i:=1 to n do
		for j:=1 to m do
			begin
			write(i,' ',j,' ');
			for k:=1 to 4 do
				if k<>4 then
					write(b[i,j,k],' ')
				else
					writeln(b[i,j,k]);
			end;}
	close(input);close(output);
end.
