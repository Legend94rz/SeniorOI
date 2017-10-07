var
	i,n,m:Longint;
	st,low,rea:array[0..100001]of longint;
	p,time,count,x,y:longint;
	lab,v,inf,val:array[0..10001]of longint;
	ss,num:longint;
	zd,d:array[0..10001]of longint;
	head,bg,ed,next:array[0..10001]of longint;
	tot,nt:longint;
	nh,ned,nnext:array[0..10001]of longint;
	ans:longint;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
procedure add(x,y:longint);
begin
	inc(tot);
	ed[tot]:=y;bg[tot]:=x;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure add2(x,y:longint);
begin
//	writeln(x,'->',y);
	inc(nt);
	ned[nt]:=y;
	nnext[nt]:=nh[x];
	nh[x]:=nt;
end;
procedure tarjan(x:longint);
var
	b,ege:longint;
begin
	v[x]:=1;
	inc(p);st[p]:=x;
	inc(time);low[x]:=time;rea[x]:=time;
	ege:=head[x];
	while ege<>0 do
		begin
			b:=ed[ege];
			if v[b]=0 then tarjan(b);
			if v[b]=1 then low[x]:=min(low[x],low[b]);
			ege:=next[ege];
        end;
	if rea[x]=low[x] then
		begin
			inc(count);
			while st[p+1]<>x do
				begin
					lab[st[p]]:=count;
					inc(inf[count],val[st[p]]);
					v[st[p]]:=2;
					dec(p);
                end;
		end;
end;
procedure spfa;
var
	q:array[0..100001]of longint;
	vis:array[0..100001]of boolean;
	l,r:longint;
	k,b,ege:longint;
begin
	l:=0;r:=1;q[r]:=lab[ss];
    fillchar(d,sizeof(d),$80);d[lab[ss]]:=inf[lab[ss]];
    fillchar(vis,sizeof(vis),0);vis[lab[ss]]:=true;
	repeat
		inc(l);if l>=100000 then l:=1;
		k:=q[l];vis[k]:=false;
		ege:=nh[k];//write(k);
		while ege<>0 do
			begin
				b:=ned[ege];//write('->',b);
				if d[k]+inf[b]>d[b] then
					begin
						d[b]:=d[k]+inf[b];
						if not vis[b] then
							begin
								inc(r);if r>=100000 then r:=1;
								q[r]:=b;vis[b]:=true;
							end;
					end;
				ege:=nnext[ege];
            end;
		//writeln;
	until l=r;
end;
begin
	readln(n,m);
	for i:=1 to m do
		begin
			readln(x,y);
			add(x,y);
        end;
	for i:=1 to n do readln(val[i]);
	readln(ss,num);
	for i:=1 to num do read(zd[i]);
	for i:=1 to n do if v[i]<>2 then tarjan(i);//tarjan要这样用!!!切记!!!
//	for i:=1 to n do writeln('>',i,' ',lab[i],' ',inf[lab[i]]);
	for i:=1 to tot do
		if lab[bg[i]]<>lab[ed[i]] then
			add2(lab[bg[i]],lab[ed[i]]);
	spfa;
//	for i:=1 to num do writeln('>>',zd[i],' ',lab[zd[i]],' ',d[lab[zd[i]]]);
	for i:=1 to num do
		if ans<d[lab[zd[i]]] then
			ans:=d[lab[zd[i]]];
	writeln(ans);
end.

