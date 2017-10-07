program solve;
const
maxn=70;
maxint=9999999;
var
	tm,gs:array[-1..maxn,-1..maxn] of longint;
	alive:array[-1..maxn] of boolean;
	order:array[-1..maxn,-1..maxn] of boolean;
	dt1,dt2:array[-1..maxn] of longint;
	hash:array[-1..maxn] of longint;
	n,m,ans,tot:longint;
function judge(x,y:longint):longint;
var
	i,j,t:longint;
begin
	if dt2[x]=dt2[y] then
		for i:=1 to n do
			if order[x,i]<>order[y,i] then exit(0);
	if dt2[x]=dt2[y] then exit(y);
	if dt2[x]<dt2[y] then
		begin
			t:=x;
			x:=y;
			y:=t;
		end;
	for i:=1 to n do
	if ((order[y,i]) and not(order[x,i])) then
		exit(0);
	exit(y);
end;
procedure del(x,y:longint);
var
	i,p:longint;
begin
	for i:=1 to dt1[y] do
		if tm[y,i]=x then
			begin
				p:=i;
				break;
			end;
	for i:=p to dt1[y]-1 do
		tm[y,i]:=tm[y,i+1];
	dec(dt1[y]);
end;
procedure datain;
var
	i,j,k,p,q:longint;
begin
	assign(input,'solve.in');reset(input);
	assign(output,'solve.out');rewrite(output);
	fillchar(hash,sizeof(hash),0);
	fillchar(alive,sizeof(alive),true);
	fillchar(order,sizeof(order),false);
	fillchar(dt1,sizeof(dt1),0);
	fillchar(dt2,sizeof(dt2),0);
	readln(n,m);
	for i:=1 to m do
		begin
			read(p);
			dt2[i]:=p;
			for j:=1 to p do
				begin
					read(q);
					gs[i,j]:=q;
					inc(dt1[q]);
					tm[q,dt1[q]]:=i;
					order[i,q]:=true;
				end;
		end;
	for i:=1 to m do
		if alive[i] then
			for j:=i+1 to m do
				if alive[j] then
					begin
						p:=judge(i,j);
						if p<>0 then
							alive[p]:=false;
						if p<>0 then
							for k:=1 to dt2[p] do
								del(p,gs[p,k]);
					end;
	tot:=0;
	for i:=1 to n do
		if dt1[i]=1 then
			if hash[i]=0 then
				begin
					hash[i]:=1;
					inc(tot);
					for j:=1 to dt2[tm[i,1]] do
						hash[gs[tm[i,1],j]]:=1;
				end;
	ans:=maxint;
end;
procedure dfs(v0,now:longint);
var
i,j:longint;
begin
	if v0=n+1 then
		begin
			if now<ans then ans:=now;
			exit;
		end;
	if v0>n then exit;
	if (now>=ans-1) and (hash[v0]=0) then exit;
	if hash[v0]>0 then dfs(v0+1,now) else
	for i:=1 to dt1[v0] do
		begin
			for j:=1 to dt2[tm[v0,i]] do
				inc(hash[gs[tm[v0,i],j]]);
			dfs(v0+1,now+1);
			for j:=1 to dt2[tm[v0,i]] do
				dec(hash[gs[tm[v0,i],j]]);
		end;
end;
procedure main;
var
	i,j:longint;
begin
	dfs(1,0);
	writeln(ans+tot);
end;
begin
	datain;
	main;
	close(input);
	close(output);
end.