const
	p:array[1..10]of int64=(2,3,5,7,11,13,17,19,23,29);
var
	i,j,n:longint;
	m,count,ans:int64;
	a:array[0..101]of longint;
function calc(x:longint):int64;
var
	i,j:longint;
begin
	calc:=1;
	for i:=1 to x do
		for j:=1 to a[i] do
			calc:=calc*p[i];
end;
procedure dfs(x:longint);
var
	i,h,j:longint;
	t,k:int64;
begin
	if x=1 then h:=10 else h:=a[x-1];
	for i:=1 to h do
		begin
            a[x]:=i;
			k:=calc(x);
			if int64(k*p[x+1])<=n then
            	dfs(x+1)
			else
				if k<=n then
				begin
					t:=1;
					for j:=1 to x do t:=t*(a[j]+1);
					if t>count then
						begin
							ans:=k;
							count:=t;
						end
					else
						if (t=count)and(k<ans) then ans:=k;//必须加上，因为dfs的顺序是:先让后面的大质数的指数能大就大，依次回溯，所以当
														//约数个数等于目前的解时，会出现乘积较小的情况，应加以判断。

                end;
			a[x]:=0;//可去掉
        end;
end;
begin
	readln(n);count:=0;
	dfs(1);
	writeln(ans);
end.

