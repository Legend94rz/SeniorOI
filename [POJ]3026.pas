type
  node=record
    	x,y,dep:longint;
        end;
var
	ch:array[0..100,0..100]of char;
	i,j,tot,ans:longint;
	u,n,m,x,y:longint;
    q:array[0..100000]of node;
    l,r,ll:longint;
    dx:array[1..4]of longint=(-1,0,1,0);
    dy:array[1..4]of longint=(0,1,0,-1);
    canvis,vis:array[0..100,0..100] of boolean;
function bfs:longint;
var
    i,kx,ky,step:longint;
begin
	l:=0;r:=ll;fillchar(vis,sizeof(vis),0);step:=0;
    for i:=1 to ll do
    	q[i].dep:=0;
	repeat
		inc(l);
		kx:=q[l].x;ky:=q[l].y;vis[kx,ky]:=true;
        //write('(',kx,',',ky,'):');
		for i:=1 to 4 do
		begin
			if (kx+dx[i]>=1)and(kx+dx[i]<=y)and(ky+dy[i]>=1)and(ky+dy[i]<=x)and(ch[kx+dx[i],ky+dy[i]]<>'#')and(canvis[kx+dx[i],ky+dy[i]])and(not vis[kx+dx[i],ky+dy[i]]) then
				begin
					inc(r);
					q[r].x:=kx+dx[i];
					q[r].y:=ky+dy[i];
                    q[r].dep:=q[l].dep+1;
                    if (ch[q[r].x,q[r].y]='A')and(canvis[q[r].x,q[r].y]) then
				        begin
                            inc(ll);
					        q[ll].x:=q[r].x;
					        q[ll].y:=q[r].y;
					        canvis[q[r].x,q[r].y]:=false;
                            //writeln(step,' ',kx,' ',ky);
					        exit(q[r].dep);
				        end;
                    //write(' (',q[r].x,',',q[r].y,')  ');
					vis[kx+dx[i],ky+dy[i]]:=true;
				end;
		end;
        //writeln;
	until l>=r;
    exit(0);
end;
procedure prim;
begin
	while tot >0 do
		begin
			inc(ans,bfs);
			dec(tot);
		end;
end;
begin
	readln(m);
	for u:=1 to m do
	begin
		readln(y,x);ans:=0;fillchar(canvis,sizeof(canvis),1);
		for i:=1 to x do
		begin
			for j:=1 to y do
				begin
				    read(ch[i,j]);
				    if ch[i,j]='S' then
				        begin
					        inc(r);
					        q[r].x:=i;
					        q[r].y:=j;inc(ll);
				        end;
				    if ch[i,j]='A' then inc(tot);
            	end;
			readln;
		end;
		prim;
		writelN(ans);tot:=0;ll:=0;r:=0;
		r:=0;fillchar(q,sizeof(q),0);fillchar(ch,sizeof(ch),' ');
		fillchar(vis,sizeof(vis),0);
	end;
end.
