var
	i,j,k,x,y,z,n,m:longint;
	dx:array[1..6]of longint=(0,0,-1,1,0,0);
	dy:array[1..6]of longint=(0,0,0,0,1,-1);
	dz:array[1..6]of longint=(-1,1,0,0,0,0);
	v:array[-101..101,-101..101,-101..101]of boolean;
	ans:array[1..6]of char=('U','D','L','R','F','B');
	a:array[0..101]of longint;
function check(x,y,z,d,step:longint):boolean;
var
	i:longint;
begin
	for i:=1 to step do
		if (v[x+dx[d]*i,y+dy[d]*i,z+dz[d]*i]) then
			exit(false);
	exit(true);
end;
procedure dfs(x,y,z,d,step:Longint);
var
	i,j:longint;
	b:boolean;
begin
	if step>=n+1 then exit;
	v[x,y,z]:=true;
	for i:=1 to 6 do
		begin
			if abs(x+dx[i]*step)+abs(y+dy[i]*step)+abs(z+dz[i]*step)>((n+1)*n-(step+1)*step)/2 then continue;
			b:=check(x,y,z,i,step-1);
			if (i<>d)and(not v[x+dx[i]*step,y+dy[i]*step,z+dz[i]*step])and b then
				begin
					a[step]:=i;
					for j:=1 to step-1 do v[x+j*dx[i],y+j*dy[i],z+dz[i]*j]:=true;
					dfs(x+dx[i]*step ,y+dy[i]*step ,z+dz[i]*step ,i, step+1);
					for j:=1 to step-1 do v[x+j*dx[i],y+j*dy[i],z+dz[i]*j]:=false;
	            end;
			if (x+dx[i]*step=0)and(y+dy[i]*step=0)and(z+dz[i]*step=0)and(step=n)and(i<>d)and b then
				begin
					for j:=1 to n-1 do write(ans[a[j]]);writeln(ans[i]);
                end;
		end;
	v[x,y,z]:=false;
end;
begin
	assign(input,'game.in');reset(input);assign(output,'game.out');rewrite(output);
	readln(n,m);
	for i:=1 to m do
		begin
			readln(x,y,z);
			if (abs(x)<=n)and(abs(y)<=n)and(abs(z)<=n) then v[x,y,z]:=true;
		end;
	dfs(0,0,0, 0, 1);
	close(output);
end.
