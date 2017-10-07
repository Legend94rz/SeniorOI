uses math;
const maxn=2147083600;
var
	i,j,n,m:longint;
	a,b:array[0..200]of longint;
	pre,next,head,ed,c:array[0..10000]of longint;//c:容量
	e:array[0..10000]of double;
	tot,s,t,p,minc:longint;
	COST,tmp:double;
	vis:array[0..1000]of boolean;
	q:array[0..30000]of longint;
	l,r:longint;
	d:array[0..10000]of double;
procedure add(x,y,co:longint;z:double);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;c[tot]:=co;
	next[tot]:=head[x];
	head[x]:=tot;
end;
function spfa:boolean ;
var
	i,k,b,ege:longint;
begin
	for i:=1 to T+1 do d[i]:=maxn;d[s]:=0;
	fillchar(vis,sizeof(vis),0);l:=0;r:=1;
	q[1]:=s;vis[s]:=true;
	repeat
		inc(l);if l>=30000 then l:=1;
		k:=q[l];vis[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				if (d[k]+e[ege]<d[b])and(c[ege]>0) then
					begin
						d[b]:=d[k]+e[ege];
						pre[b]:=ege;
						if not vis[b] then
							begin
								inc(r);if r>=30000 then r:=1;
								q[r]:=b;
								vis[b]:=true;
							end;
					end;
				ege:=next[ege];
			end;
	until l=r;
	exit(d[t]<d[t+1]);
end;
begin
	readln(n);
	for i:=1 to 2*n do readln(a[i],b[i]);
	s:=0;t:=2*n+1;tot:=1;
	for i:=1 to n do
		begin
			add(s,i,1,0);add(i,s,0,0);
			for j:=n+1 to 2*n do
				begin
					add(i,j,1,sqrt(sqr(a[i]-a[j])+sqr(b[i]-b[j])));
					add(j,i,0,-sqrt(sqr(a[i]-a[j])+sqr(b[i]-b[j])));
				end;
			add(n+i,t,1,0);
			add(t,n+i,0,0);
		end;
	while spfa do
		begin
			p:=t;minc:=maxlongint;
			while p<>s do
				begin
					minc:=min(minc,c[pre[p]]);
					p:=ed[pre[p] xor 1];
				end;
			p:=t;
			while p<>s do
				begin
					dec(c[pre[p]],minc);
					inc(c[pre[p]xor 1],minc);
					p:=ed[pre[p]xor 1];
				end;
			cost:=cost+d[t];
			fillchar(pre,sizeof(pre),0);
		end;
	writeln(cost:0:3);
end.

