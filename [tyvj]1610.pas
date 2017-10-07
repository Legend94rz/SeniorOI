uses math;
const mm=1117;
var
	i,j,n,m,t,x,y,p,tans,k,tot:Longint;
	z:array[0..30,0..30]of longint;
	color:array[0..100]of longint;
	f:array[0..100,0..100]of boolean;
	usd:array[0..100]of longint;
function check(x,y:longint):boolean;
var
	i:longint;
begin
	for i:=1 to n do
		if f[x,i] and (color[i]=y) then
			exit(false);
	exit(true);
end;
procedure dfs(s,limit:longint);//当前搜索第s个村,一共用limit种颜色
var
	i:longint;
begin
	if n-s+1+p<limit then exit;
	//如果 未搜的村子数<本次搜索上限-已选的颜色数 则退出,
	//因为这样搜索下去是错的.我们要的结果是n个村子用恰好为limit种颜色的方案，而这样很明显不够limit种
	if s=n+1 then begin inc(tans); exit; end;
	for i:=1 to limit do
		if check(s,i) then//第s个村子能用第i种颜色
			begin
				color[s]:=i;//s的颜色为i
				inc(usd[i]);//第i种颜色的使用次数
				if usd[i]=1 then inc(p);//当前已选择p种颜色
				dfs(s+1,limit);
				color[s]:=0;dec(usd[i]);
				if usd[i]=0 then dec(p);
			end;
end;
begin
	readln(n,t,m);
	for i:=1 to m do
		begin
			read(x,y);
			f[x,y]:=true;
			f[y,x]:=true;
		end;
	for i:=0 to 30 do z[i,0]:=1;
	for i:=1 to 20 do
		for j:=1 to i do
			z[i,j]:=(z[i-1,j]+z[i-1,j-1])mod mm;
	k:=min(t,n);
	for i:=1 to k do
		begin
			p:=0;tans:=0;fillchar(usd,sizeof(usd),0);
			dfs(1,i);//n个村子用i种颜色的方法
			inc(tot,(tans*z[t,i]) mod mm);//相乘并累加至答案
		end;
	writeln(tot mod mm);
end.

