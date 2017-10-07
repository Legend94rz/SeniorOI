var
	i,j,n,m,x,y:longint;
	tot,count:longint;
	lab,num:array[0..10001]of longint;
	ed,head,next:array[0..10001]of longint;
	v:array[0..10001]of byte;
	p,time:longint;
	st:array[0..10001]of longint;
	rea,low:array[0..10001]of longint;
procedure add(x,y:longint);
begin
	inc(tot);
	ed[tot]:=y;
	next[tot]:=head[x];
	head[x]:=tot;
end;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
procedure dfs(x:longint);
var
	b,ege:longint;
begin
	inc(time);rea[x]:=time;low[x]:=time;
	inc(p);st[p]:=x;
	v[x]:=1;
	ege:=head[x];
	while ege<>0 do
		begin
			b:=ed[ege];
			if v[b]=0 then dfs(b);
			if v[b]=1 then low[x]:=min(low[x],low[b]);
			ege:=next[ege];
		end;
	if rea[x]=low[x] then
		begin
			inc(count);
			while st[p+1]<>x do
				begin
					lab[st[p]]:=count;
                    inc(num[count]);
					v[st[p]]:=2;
                    dec(p);
				end;
		end;
end;
begin
	readln(n,m);
	for I:=1 to m do
		begin
			readln(x,y);
			add(x,y);
		end;
	for i:=1 to n do if v[i]=0 then dfs(i);
	for i:=1 to n do
		if num[lab[i]]>1 then
			writeln('T')
		else
			writeln('F');
		//writeln(lab[i]);
end.

