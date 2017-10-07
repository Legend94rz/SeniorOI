type
	node=record
	x,y:longint;
	end;
var
	i,j,n,m,TotalTime,Q,High,Num,k,p,l:longint;
	ch:array[0..101,0..101]of char;
	d:array[0..101,0..101,0..101]of longint;
	t:array[0..501,0..501]of longint;
	Rx,Bx,Gx,sx,sy:longint;
	R,B,G,a,x,y,money:array[0..10001]of longint;
	f:array[0..801,0..10,0..101]of longint;
	//(前i件物品,)花j的时间,踩k次陷阱,一共花L的钱所获得的最大价值
	dx:array[1..4]of longint=(0,1,0,-1);
	dy:array[1..4]of longint=(1,0,-1,0);
	ans:longint;
function min(a,b:Longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
procedure bfs;
var
	i,delt,j,l,r:longint;
	q:array[0..100001]of node;
	t:node;
	v:array[0..101,0..101]of boolean;
begin
	l:=0;r:=1;q[r].x:=sx;q[r].y:=sy;
	fillchar(d,sizeof(d),$3f);d[sx,sy,0]:=0;
	fillchar(v,sizeof(v),0);v[sx,sy]:=true;
	repeat
		inc(l);
		for i:=1 to 4 do
			begin
				t.x:=q[l].x+dx[i];
				t.y:=q[l].y+dy[i];v[t.x,t.y]:=false;
				if (t.x>=1)and(t.x<=n)and(t.y>=1)and(t.y<=m) and(ch[t.x,t.y]<>'#') then
					begin
						if ch[t.x,t.y]='D'then delt:=1 else delt:=0;
						for j:=0 to High-delt do
							if d[q[l].x,q[l].y,j]+1<d[t.x,t.y,j+delt] then
								begin
									d[t.x,t.y,j+delt]:=d[q[l].x,q[l].y,j]+1;
									if not v[t.x,t.y] then begin
                                        inc(r);q[r]:=t;v[t.x,t.y]:=true;
									end;
								end;
                    end;
            end;
	until l=r;
end;
begin
	readln(n,m,TotalTime,Q,High);
	for i:=1 to n do
		begin
			for j:=1 to m do
				begin
					read(ch[i,j]);
					if ch[i,j]='S' then begin sx:=i;sy:=j;end;
					if ch[i,j]='P' then inc(num);
				end;
			readln;
		end;
	readln(Rx,Bx,Gx);
	for i:=1 to num do begin readln(x[i],y[i],r[i],b[i],g[i],a[i]);money[i]:=r[i]*rx+b[i]*bx+g[i]*gx;end;
	bfs;
	fillchar(t,sizeof(t),$3f);
	for i:=1 to num do//<=400;		第i个物品
		for j:=0 to High do// <=10	一共走j次
			for k:=0 to j do//<=10	去的时候走了k次
				if (d[x[i],y[i],k]<>$3f3f3f3f)and(d[x[i],y[i],j-k]<>$3f3f3f3f) then
					t[i,j]:=min(t[i,j],d[x[i],y[i],k]+d[x[i],y[i],j-k]*3);
//	for I:=1 to num do writeln(d[2,2,0],' ',d[2,2,1],' ',d[2,2,2]);
	ans:=Q;
	for k:=1 to num do					//前k个物品
		for j:=TotalTime downto 0 do	//花j的时间
			for i:=High downto 0 do		//一共踩i次陷阱
				for l:=q downto money[k] do//一共用l的money
					for p:=0 to i do	//第k个物品要踩p次
						if (j>=t[k,p]) then
							if f[j-t[k,p],i-p,l-money[k]]+a[k]>f[j,i,l] then
								begin
									f[j,i,l]:=f[j-t[k,p],i-p,l-money[k]]+a[k];
									if f[j,i,l]+Q-l>ans then ans:=f[j,i,l]+Q-l;
								end;
	writeln(ans);
end.

