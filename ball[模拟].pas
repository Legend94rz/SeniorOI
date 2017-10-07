const
	g:array[0..1]of char=('\','/');
var
	i,j,n,m,lst:longint;
	s,x,z,y,zs,ys,zx,yx:longint;
	ch:array[-101..101,-101..101]of char;
	sc,xc,zc,yc:boolean;
	dre,t,e:longint;
	ce:array[1..4,1..4]of longint;
	dx:array[1..4,1..4]of longint=(	(0,-1,0,0),(-1,0,0,0),(0,0,0,1),(0,0,1,0));
	dy:array[1..4,1..4]of longint=(	(0,0,0,1),(0,0,-1,0),(0,-1,0,0),(1,0,0,0));
	zi:array[1..4]of longint=(-1,-1,1,1);
	zj:array[1..4]of longint=(1,-1,-1,1);
function judge(s,x,z,y:boolean):longint;
begin
	if s then
		begin
			if z then exit(5);
			if y then exit(6);
			exit(1);
		end;
	if x then
		begin
			if z then exit(8);
			if y then exit(7);
			exit(3);
        end;
	if z then
		begin
			if s then exit(5);
			if x then exit(8);
			exit(4);
        end;
	if y then
		begin
			if s then exit(6);
			if x then exit(7);
			exit(2);
        end;
	exit(0);
end;
begin
	assign(input,'ball.in');reset(input);assign(output,'ball.out');rewrite(output);
	readln(m,n,e);
	readln(s,y,x,z,zs,ys,yx,zx);
	ce[1,4]:=s;ce[2,3]:=s;ce[3,1]:=zx;ce[4,1]:=x;
	ce[1,2]:=y;ce[2,1]:=z;ce[3,2]:=x;ce[4,2]:=yx;
	ce[1,3]:=ys;ce[2,4]:=zs;ce[3,4]:=z;ce[4,3]:=y;
	for i:=-101 to 101 do
		for j:=-101 to 101 do
			ch[i,j]:=' ';

    i:=1;j:=1;dre:=4;lst:=4;
	while e>0 do
		begin
			xc:=i+zi[lst]>m;yc:=j+zj[lst]>n;
			zc:=j+zj[lst]<1;sc:=i+zi[lst]<1;
			if ch[i,j]<>g[dre mod 2] then ch[i,j]:=g[dre mod 2] else break;
			//writeln(i,' ',j,' ',lst);readln;
            t:=dre;
			case judge(sc,xc,zc,yc) of
				1:begin if dre=1 then dre:=4 else dre:=3; i:=i+dx[t,dre];j:=j+dy[t,dre];end;//ok
				2:begin if dre=4 then dre:=3 else dre:=2; i:=i+dx[t,dre];j:=j+dy[t,dre];end;//ok
				3:begin if dre=4 then dre:=1 else dre:=2; i:=i+dx[t,dre];j:=j+dy[t,dre];end;//ok
				4:begin if dre=3 then dre:=4 else dre:=1; i:=i+dx[t,dre];j:=j+dy[t,dre];end;//ok
				5,6:begin dre:=dre+2;i:=i+dx[t,dre];j:=j+dy[t,dre];end;
				7,8:begin dre:=dre-2;i:=i+dx[t,dre];j:=j+dy[t,dre]; end;
				0:begin  i:=i+zi[lst];J:=j+zj[lst]; end;
				end;
			//writeln('^^ ',judge(sc,xc,zc,yc));
			dec(e,ce[t,dre]);
			lst:=dre;
        end;
	write(' ');for i:=1 to n do write('-');writeln;
    for i:=1 to m do
		begin
			write('|');
			for j:=1 to n do write(ch[i,j]);
			writeln('|');
		end;
    write(' ');for i:=1 to n do write('-');writeln;
	close(output);
end.

