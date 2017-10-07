type
	eage=record
		time,tl:longint;
		end;
var
	i,j,n,m:longint;
	e:array[0..100000]of eage;
	head,next,ed:array[0..100000]of longint;
	tot,ans:longint;
	x,y,z,w:longint;
	vis:array[0..10000]of boolean;
procedure dfs(K,t,s:longint);
var
	b,ege:longint;
begin
	if (k=y)then
		begin
			if s<ans then ans:=s;
			exit;
		end;
	ege:=head[k];
	while ege<>0 do
		begin
			b:=ed[ege];//writeln(k,' ',b,' ',(not vis[b]),' ',(t+e[ege].tl<z),' ',(s+e[ege].time<ans));
			if (not vis[b])and(t+e[ege].tl<=z)and(s+e[ege].time<ans) then
				begin
					vis[b]:=true;
					dfs(b,t+e[ege].tl,s+e[ege].time);
					vis[b]:=false;
				end;
			ege:=next[ege];
		end;
end;
procedure add(x,y,z,w:longint);
begin
	inc(tot);
	e[tot].tl:=z;e[tot].time:=w;
	ed[tot]:=y;next[tot]:=head[x];
	head[x]:=tot;
end;
begin
	readln(n,m);
	for i:=1 to m do
		begin
			read(x,y,z,w);
			add(x,y,z,w);add(y,x,z,w);
		end;
	readln(x,y);
	readln(z);
	ans:=maxlongint;
	dfs(x,0,0);
	if ans<>maxlongint then
		writeln(ans)
	else
		writeln(-1);
end.

