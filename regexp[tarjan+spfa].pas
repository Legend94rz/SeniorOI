var
	i,j,n,m:Longint;
	ed,next,head,d:array[0..100001]of longint;
	a,b,e:array[0..100001]of longint;
	nhead,ned,nnext,ne:array[0..100001]of longint;
	tot,ntot,x,y,z:longint;
	p,count,time:longint;
	v:array[0..10001]of longint;
	st,rea,low,lab,q:array[0..100001]of longint;
procedure add(x,y:longint);
begin
	inc(tot);
	ed[tot]:=y;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure add2(x,y,z:longint);
begin
	//writeln('Add',x,'->',y);
	inc(ntot);
	ned[ntot]:=y;ne[ntot]:=z;
	nnext[ntot]:=nhead[x];
	nhead[x]:=ntot;
end;
function min(a,b:Longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
procedure dfs(x:longint);
var
	k,b,ege:longint;
begin
	v[x]:=1;
	inc(time);rea[x]:=time;low[x]:=time;
	inc(p);st[p]:=x;
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
					v[st[p]]:=2;
					dec(p);
                end;
		end;
end;
procedure spfa(s:longint);//注意是新图
var
	k,b,ege,l,r:longint;
	v:array[0..100001]of boolean;
begin
	fillchar(v,sizeof(v),0);v[s]:=true;
	l:=0;r:=1;q[r]:=s;
	fillchar(d,sizeof(d),$3f);d[s]:=0;
	repeat
		inc(l);if l>=100000 then l:=1;
		k:=q[l];v[k]:=false;
		ege:=nhead[k];//write(k);
		while ege<>0 do
			begin
				b:=ned[ege];
				//write('->',b);
				if d[k]+ne[ege]<d[b] then
					begin
						d[b]:=d[k]+ne[ege];
						if not v[b] then
							begin
								inc(r);if r>=100000 then r:=1;
								q[r]:=b;v[b]:=true;
							end;
					end;
				ege:=nnext[ege];
            end;
		//writeln;
	until l=r;
end;
begin
	assign(input,'regexp.in');reset(input);assign(output,'regexp.out');rewrite(output);
	readln(n,m);
	for i:=1 to m do
		begin
			readln(x,y,z);
			a[i]:=x;b[i]:=y;e[i]:=z;
			add(x,y);
		end;
	for I:=1 to n do
		if v[i]=0 then
			dfs(i);
//	for i:=1 to n do writeln('>>',lab[i]);
	for i:=1 to m do
		begin
			if lab[a[i]]<>lab[b[i]] then
				add2(lab[a[i]],lab[b[i]],e[i]);
		end;
	spfa(lab[1]);//To lab[n]
	writeln(d[lab[n]]);
	close(output);
end.

