var
	n,i,j,ans:longint;
	used:array[1..9]of boolean;
	a:array[1..9]of longint;
	maxn,s:double;
	x,y:array[-1..12]of longint;
	zuo,you,sha,xia:double;
function min(a,b:double):double;
begin
	if a<b then exit(a);
	exit(b);
end;
function max(a,b:double):double;
begin
	if a>b then exit(a);
	exit(b);
end;
procedure cal;
var
	i,j:longint;
	r:array[0..10]of double;
	mini,d:double;
begin
	//writeln('---------');
	for i:=1 to n do
		begin
			r[i]:=min(abs(x[a[i]]-zuo),abs(x[a[i]]-you));
			if r[i]>abs(y[a[i]]-sha) then r[i]:=abs(y[a[i]]-sha);
			if r[i]>abs(y[a[i]]-xia) then r[i]:=abs(y[a[i]]-xia);
			for j:=i-1 downto 1 do
				begin
					d:=sqrt( sqr(x[a[i]]-x[a[j]])+sqr(y[a[i]]-y[a[j]]) )-r[j];
					if (r[i]>d) then
						r[i]:=d;
					if r[i]<0 then r[i]:=0;
				end;
		end;
	mini:=0;
	for i:=1 to n do
		begin
			mini:=mini+3.141592653*r[i]*r[i];
			//writeln(i,' ',r[i]:0:2);
		end;
	if s-mini<maxn then
		maxn:=s-mini;
	//writeln('tot=',s:0:3,' cut:',mini:0:3,' rest:',s-mini:0:3,' now maxn=',maxn:0:3);
	//writeln('---------');
end;
procedure dfs(i:longint);
var
	k,j:longint;
begin
	if i>n then exit;
	for k:=1 to n do
		if not used[k] then
			begin
				used[k]:=true;
				a[i]:=k;
				if i=n then
					begin
					{for j:=1 to n-1 do
						write(a[j],' ');
					writeln(a[n]);}
					cal;
					end;
				dfs(i+1);
				used[k]:=false;
			end;
end;
begin
	assign(input,'box.in');reset(input);assign(output,'box.out');rewrite(output);
	readln(n);
	maxn:=9999999999;
	readln(x[-1],y[-1],x[0],y[0]);
	zuo:=min(x[-1],x[0]);you:=max(x[-1],x[0]);
	sha:=max(y[-1],y[0]);xia:=min(y[-1],y[0]);
	for i:=1 to n do
		readln(x[i],y[i]);
	s:=(abs(x[-1]-x[0]))*(abs(y[-1]-y[0]));
	if n>0 then
		dfs(1)
	else
		begin
			writeln(s:0:0);
			halt;
		end;
	if maxn-round(maxn)<0.5 then
		ans:=round(maxn)
	else
		ans:=trunc(maxn);
	writeln(ans);
	close(output);
end.
