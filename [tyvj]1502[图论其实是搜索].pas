uses math;
var
	v:array[0..100]of longint;
	q,res:array[-1..1005]of longint;
	i,r,maxn,n,x,y,z,t,ans,rr:longint;
	b,e:array[0..100,0..100]of longint;
	vis:array[0..100]of boolean;
procedure upgrade(d:longint);
var
	i:longint;
	sum:longint;
	max1,max2:longint;
begin
	if d<=2 then
		begin
			if d=1 then
				begin
					if ans>e[q[2],q[1]] then
						begin
							res:=q;rr:=r;ans:=e[q[2],q[1]];
						end
				end
			else
				begin
					t:=min(e[q[1],q[2]],e[q[2],q[3]]);
					if t<ans then
						begin
							ans:=t;res:=q;rr:=r;
						end
				end
		end
	else
		begin
			sum:=0;max1:=-2;max2:=-1;
			for i:=2 to r do
				begin
					inc(sum,e[q[i],q[i-1]]);
					if e[q[i],q[i-1]]>max1 then
						begin
							max2:=max1;
							max1:=e[q[i],q[i-1]];
						end
					else
						if (e[q[i],q[i-1]]>max2) then
							max2:=e[q[i],q[i-1]];
				end;
			if sum-max1-max2<ans then
				begin
					ans:=sum-max1-max2;
					res:=q;rr:=r;
				end;
		end;
	{for i:=1 to r do
		write(q[i],' ');
	writeln;}
end;
procedure dfs(s,deep,limit:longint);
var
	i:longint;
begin
	inc(r);q[r]:=s;
	if (deep=limit)and(s=1) then begin upgrade(limit);exit;end;
	if deep>limit then exit;
	vis[s]:=true;
	{for i:=1 to v[s] do
		if (not vis[b[s,i]])then
			if (deep+1<limit)and(b[s,i]=1) then
				continue
			else
				begin
					vis[b[s,i]]:=true;
					dfs(b[s,i],deep+1,limit);
					vis[b[s,i]]:=false;
					q[r]:=-1;dec(r);
				end;}
	for i:=0 to n do
		if (not vis[i])and(e[s,i]<>0)then
			if (deep+1<limit)and(i=1) then
				continue
			else
				begin
					vis[i]:=true;
					dfs(i,deep+1,limit);
					vis[i]:=false;
					q[r]:=-1;dec(r);
				end;
end;
procedure add(x,y,z:longint);
begin
	inc(v[x]);
	b[x,v[x]]:=y;
	e[x,y]:=z;
end;
begin
	readln(n);
	for i:=1 to n do
		begin
			readln(x,y,z);
			add(x,y,z);add(y,x,z);
			maxn:=max(x,max(y,maxn));
		end;
	ans:=maxlongint;
	for i:=1 to n do
		begin
			fillchar(vis,sizeof(vis),0);r:=0;
			fillchar(q,sizeof(q),$FF);
			dfs(0,0,i);
		end;
	For i:=1 to rr do
		write(res[i],' ');
	writeln(ans);
end.

