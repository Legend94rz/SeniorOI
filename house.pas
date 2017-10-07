const
	dx:array[1..4]of longint=(0,-1,0,1);
	dy:array[1..4]of longint=(-1,0,1,0);
var
	path:array[0..101,0..101,1..4]of boolean;
	t,i,j,n,m,now,k:longint;
	room:array[0..101,0..101]of longint;
	count:array[0..10001]of longint;
procedure dfs(x,y:longint);
var
	i,j,k:longint;
begin
	room[x,y]:=now;
	for i:=1 to 4 do
		if (room[x+dx[i],y+dy[i]]=0)and(not path[x,y,i])and(x+dx[i]<=n)and(x+dx[i]>=1)and(y+dy[i]>=1)and(y+dy[i]<=m) then
			dfs(x+dx[i],y+dy[i]);
end;
begin
	assign(input,'house.in');reset(input);assign(output,'house.out');rewrite(output);
	readln(n);
	readln(m);
	for i:=1 to n do
		for j:=1 to m do
			begin
				read(t);
				if t>=8 then begin dec(t,8);path[i,j,4]:=true;end;
				if t>=4 then begin dec(t,4);path[i,j,3]:=true;end;
				if t>=2 then begin dec(t,2);path[i,j,2]:=true;end;
				if t>=1 then begin dec(t,1);path[i,j,1]:=true;end;
			end;
	for i:=1 to n do
		for j:=1 to m do
			if room[i,j]=0 then
				begin
					inc(now);
					dfs(i,j);
				end;
	for i:=1 to n do
		for j:=1 to m do
			inc(count[room[i,j]]);
	writeln(now);
	for i:=2 to now do
		if count[i]>count[1] then
			count[1]:=count[i];
	writeln(count[1]);
	close(output);
end.

