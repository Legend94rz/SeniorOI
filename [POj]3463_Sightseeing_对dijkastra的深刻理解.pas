var
	i,j,n,m,x,y,z,st,en:longint;
	u,t:longint;
	tot:longint;
	ed,e,head,next:array[0..20001]of longint;
	ans,d:array[0..2001,1..2]of longint;
	vis:array[0..2001,1..2]of boolean;

	c1,c2:char;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure dijkstra;
var
	i,j,k,s:longint;
	tmin,tmink:longint;
	ege,b:longint;
begin
	tmink:=1;s:=st;
	while true do
		begin
			vis[s,tmink]:=true;tmin:=$3f3f3f3f;
			ege:=head[s];
			while ege<>0 do
				begin
					b:=ed[ege];
					{比最短路短,更新最短路,路径数继承前继节点}
					if d[s,tmink]+e[ege]<d[b,1] then
                        begin
							d[b,2]:=d[b,1];ans[b,2]:=ans[b,1];
                            d[b,1]:=d[s,tmink]+e[ege];
                            ans[b,1]:=ans[s,tmink];
                        end
					else
					{等于最短路,将当前计数与前继节点的计数相加}
					if d[s,tmink]+e[ege]=d[b,1] then begin ans[b,1]:=ans[b,1]+ans[s,tmink];end
					else
					{大于最短路,小于次短路,更新次短路(继承前继节点)}
					if (d[s,tmink]+e[ege]<d[b,2]) then
                        begin
                            d[b,2]:=d[s,tmink]+e[ege];
							ans[b,2]:=ans[s,tmink];
                        end
					else
					{等于次短路,将当前计数与前继节点的计数相加}
					if d[s,tmink]+e[ege]=d[b,2] then begin ans[b,2]:=ans[b,2]+ans[s,tmink];end;
					ege:=next[ege];
				end;
			tmink:=0;s:=0;
			for i:=1 to n do
				for j:=1 to 2 do
					if not vis[i,j] then
						if d[i,j]<tmin then
							begin
								tmin:=d[i,j];
								tmink:=j;
								s:=i;
							end;
			if (tmin=$3f3f3f3f)or(tmink=0)or(s=0)then break;
		end;
end;
begin
	readln(t);
	for u:=1 to t do
		begin
			fillchar(head,sizeof(head),0);tot:=0;
			fillchar(vis,sizeof(vis),0);fillchar(ans,sizeof(ans),0);
			fillchar(d,sizeof(d),$3f);
			readln(n,m);
			for i:=1 to m do
				begin
					readln(x,y,z);
					add(x,y,z);
				end;
			readln(st,en);
            d[st,1]:=0;ans[st,1]:=1;
			dijkstra;
			//for i:=1 to n do writeln(d[i,1]:11,' ',d[i,2]:11,' ',vis[i,1],' ',ans[i,1],' ',vis[i,2],' ',ans[i,2]);
			if d[en,1]+1=d[en,2] then
				writeln(ans[en,1]+ans[en,2])
			else
				writeln(ans[en,1]);
		end;
end.

