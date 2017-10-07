program bao;
uses
	math;
var
	next,ed,e,head:array[0..7001]of longint;
	tot,n,m,t,d,mini,i,j:longint;
	w,cost:array[0..2000]of longint;
	x,y,z:longint;
	xx,yy:longint;
	f:array[0..100000]of longint;
	vis:array[0..2001]of boolean;
	q:array[0..30000]of longint;
	l,r:longint;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;
	e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure spfa;
var
	ege,k,b:longint;
begin
	l:=0;r:=1;fillchar(cost,sizeof(cost),$3f);cost[1]:=0;vis[1]:=true;q[1]:=1;
	repeat
		inc(l);
		if l>30000 then l:=1;
		k:=q[l];vis[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				if cost[k]+e[ege]<cost[b] then
					begin
						cost[b]:=cost[k]+e[ege];
						if not vis[b] then
							begin
								inc(r);
								if r>30000 then r:=1;
								q[r]:=b;
								vis[b]:=true;
							end;
					end;
				ege:=next[ege];
			End;
	Until l=r;
end;
procedure dfs(s:longint);
var
	ege,b:longint;
begin
	mini:=min(w[s],mini);
	ege:=head[s];
	while ege<>0 do
		begin
			b:=ed[ege];
			if not vis[b] then
				begin
					vis[b]:=true;
					dfs(b);
				end;
			ege:=next[ege];
		end;
	w[s]:=mini;
end;
begin
	assign(input,'bao.in');reset(input);
        assign(output,'bao.out');rewrite(output);
	readln(n,m,t,d);w[1]:=0;
	for i:=2 to n do
		readln(w[i]);
	for i:=1 to m do
		begin
			readln(x,y,z);
			add(x,y,z);add(y,x,z);
		End;
	spfa;
	fillchar(head,sizeof(head),0);tot:=0;fillchar(vis,sizeof(vis),0);
	fillchar(next,sizeof(next),0);fillchar(ed,sizeof(ed),0);
	for i:=1 to d do
		begin
			readln(xx,yy);
			add(xx,yy,0);add(yy,xx,0);
		end;
	for i:=1 to n do
		begin
			mini:=$7f7f7f7f;
			dfs(i);
		End;
	for i:=1 to n do cost[i]:=cost[i] shl 1;
	for i:=1 to n do
		for j:=t downto cost[i] do
			f[j]:=max(f[j],f[j-cost[i]]+w[i]);
	writeln(f[t]);
	close(output);
end.
