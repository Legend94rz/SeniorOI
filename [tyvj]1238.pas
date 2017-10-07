var
	i,j,n,m:longint;
	next,head,ed,e:array[0..10000]of longint;
	x,y,z,tot,ans,num:longint;
	vis:array[0..1000]of boolean;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure dfs(s,count,cost:longint);
var
	ege,k,b:longint;
begin
	if s=1 then
		begin
			if count<num then
				begin
					num:=count;
					ans:=cost;
				end
			else
				if (count=num)and(cost<ans) then
					ans:=cost;
			exit;
		end;
	ege:=head[s];
	while ege<>0 do
		begin
			b:=ed[ege];
			if (not vis[b])and(count+1<=num) then
				begin
					vis[b]:=true;
					dfs(b,count+1,cost+e[ege]);
					vis[b]:=false;
				end;
			ege:=next[ege];
		end;
end;
begin
	readln(n,m);
	for i:=1 to m do
		begin
			readln(x,y,z);
			add(x,y,z);
		end;
	ans:=maxlongint;num:=ans;
	dfs(0,0,0);
	writeln(ans);
end.

