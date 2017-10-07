const
	dx:array[1..4]of longint=(-1,0,1,0);
	dy:array[1..4]of longint=(0,1,0,-1);
var
	ans:int64;
	r,c,x,y,i,j,md,max:longint;
	a:array[0..200,0..200]of longint;
begin
	readln(r,c);
	for i:=1 to r do
		for j:=1 to c do
			read(a[i,j]);
	x:=1;y:=1;ans:=a[1,1];
	while (x<>r)or(y<>c) do
		begin
			max:=-1;
			for i:=1 to 4 do
				if a[x+dx[i],y+dy[i]]>max then
					begin
					md:=i;
					max:=a[x+dx[i],y+dy[i]];
					end;
			a[x,y]:=-1;
			//writeln(x+dx[md],' ',y+dy[md]);
			x:=x+dx[md];y:=y+dy[md];
			inc(ans,a[x,y]);
		end;
	writeln(ans);
end.
