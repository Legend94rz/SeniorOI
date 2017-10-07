var
	i,j,n,x,y:Longint;
	dp:array[0..2,0..10001]of longint;
	tot:longint;
	head,ed,next:array[0..300001]of longint;
procedure add(x,y:Longint);
begin
	inc(tot);
	ed[tot]:=y;
	next[tot]:=head[x];
	head[x]:=tot;
end;
function min(a,b:Longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
procedure dfs(u,fa:longint);
var
	i:longint;
	v,ege:longint;
	isleaf:boolean;
begin
	dp[0,u]:=1;
	dp[1,u]:=1 shl 20;
	dp[2,u]:=0;
	ege:=head[u];isleaf:=true;
	while ege<>0 do
		begin
			v:=ed[ege];
			if v<>fa then
				begin
					dfs(v,u);isleaf:=false;
					inc(dp[0,u],min(dp[0,v],dp[2,v]));
					inc(dp[2,u],min(dp[0,v],dp[1,v]));
                end;
			ege:=next[ege];
        end;
	if not isleaf then
		begin
			ege:=head[u];
			while ege<>0 do
				begin
					v:=ed[ege];
					if v<>fa then dp[1,u]:=min(dp[1,u],dp[2,u]-min(dp[0,v],dp[1,v])+dp[0,v]);
					ege:=next[ege];
                end;
        end;
end;
begin
	readln(n);
	for i:=1 to n-1 do
		begin
			readln(x,y);
			add(x,y);add(y,x);
        end;
	dfs(1,-1);
	writeln(min(dp[0,1],dp[1,1]));
end.


