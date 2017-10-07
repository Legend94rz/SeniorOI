var
	b,e:array[0..300,0..300]of longint;
	i,j,n,m,p,le,k,limit,x:longint;
	v:array[0..300]of longint;
	lv:array[0..300]of longint;
	bian,jia:longint;
	vis:array[0..1000]of boolean;
	sp:longint;
	low,high:longint;
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
function min(a,b:longint):longint;
begin
	if (a<b)and(a>0) then exit(a);
	exit(b);
end;
procedure dfs(s,p:longint);
var
	i,j,k:longint;
	tl,th,ts:longint;
begin
	if (s=1)and(p<sp) then
		sp:=p;
	if vis[s] then exit;
        vis[s]:=true;
	for k:=1 to v[s] do
		if (not vis[b[s,k]])and(abs(lv[1]-lv[b[s,k]])<=limit) then
			begin
				if s=0 then lv[0]:=lv[b[s,k]];
				tl:=low;
				th:=high;
				low:=min(low,lv[b[s,k]]);
				high:=max(high,lv[b[s,k]]);
				if abs(low-high)<=limit then
					dfs(b[s,k],p+e[s,b[s,k]]);
				low:=tl;
				high:=th;
			end;
        vis[s]:=false;
end;
begin
	readln(limit,n);
	for i:=1 to n do
		begin
			readln(p,le,x);
			inc(v[0]);
			b[0,v[0]]:=i;
			e[0,i]:=p;
			lv[i]:=le;
			for j:=1 to x do
				begin
					readln(bian,jia);
					inc(v[bian]);
					b[bian,v[bian]]:=i;
					e[bian,i]:=jia;
				end;
		end;
	low:=$3f3f3f3f;high:=0;sp:=low;
	dfs(0,0);
	writeln(sp);
end.
