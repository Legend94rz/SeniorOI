program poj1742;
{
题目描述：
给你n种硬币，知道每种的面值a[i]和每种的数量c[i]。
问你能凑出多少种不大于m的面值。
n <= 100, a[i] <= 100000, c[i] <= 1000      1<=i<=n
m<=10000
解题报告：
vst[i]表示是否能够凑成i面值。 0<=i<=m
开始时，vst[0] = 1,其他均为0
dp[i][j]   1<=i<=m 0<=j<=1
dp[i][0] 表示凑成i面值的最后一枚硬币是哪一种（种号默认为输入的顺序，1~n).
dp[i][1] 表示dp[i][0]这种硬币已经用了几枚了。
然后依次对n种硬币扫描（第一层for循环）
对于每种硬币i，用变量j 扫描a[i]~m区间
如果vst[j - a[i]] == 1 并且 vst[j] == 0
那么有可能可以用一枚大小为a[i]的硬币与j - a[i]组合，构成j面值。
但是如果j - a[i]的组合中已经有了c[i]枚a[i]，那么a[i]就不能和j - a[i]组合了。
即：由上述dp的定义。
当dp[j - a[i]][0] == i 并且dp[j - a[i]][1] == c[i]时，便不能组合。
即当vst[j - a[i]] == 1 并且 vst[j] == 0 并且 ！（dp[j - a[i]][0] == i 并且dp[j - a[i]][1] == c[i]）
的时候，vst[j]可以更新为1.
同时为了维护dp的定义：
如果dp[j - a[i]][0] != i.
则：dp[j][0] = i， dp[j][1] = 1;
否则：dp[j][1] = dp[j - a[i]][1] + 1 // 在j - a[i]的组合上多了一枚a[i]
 
代码如下，很短：
#include<iostream>
using namespace std;
int n, m, vst[100001], a[101], c[101], dp[100001][2], pre, ans;
int main()
{
    while(scanf("%d%d", &n, &m) && (n || m))
    {
        for(int i = 1; i <= n; i++) scanf("%d", &a[i]);
        for(int i = 1; i <= n; i++) scanf("%d", &c[i]);
        memset(vst, 0 , sizeof(vst));vst[0] = 1;ans = 0;
        memset(dp, 0, sizeof(dp));
        for(int i = 1; i <= n; i++)
            for(int j = a[i]; j <= m; j++)
                if (!vst[j] && vst[pre = j - a[i]] && !(dp[pre][0] == i && dp[pre][1] == c[i]) )
                {
                    ans += (vst[j] = 1);dp[j][0] = i;
                    dp[j][1] = dp[pre][0] == i ? dp[pre][1] + 1 : 1;
                }
        printf("%d\n", ans);
    }
    return 0;
}
}
var
	f:array[0..100005]of boolean;
	a,c:array[0..200]of longint;
	v,n,i:longint;
	ans:qword;
procedure mutipack(cost,ki:longint);
var
	m,i:longint;
begin
	m:=1;
	if ki*cost>=v then
		begin
			for i:=cost to v do
				if (f[i-cost])and(not f[i]) then
					begin
						inc(ans);
						f[i]:=true;
					end;
			exit;
		end;
	while ki>0 do
		begin
			if m>ki then m:=ki;
			ki:=ki-m;
			for i:=v downto m*cost do
				if (f[i-m*cost])and(not f[i]) then
					begin
						inc(ans);
						f[i]:=true;
					end;
			m:=m shl 1;
		end;
end;
begin
	assign(input,'bag.in');reset(input);assign(output,'bag.txt');rewrite(output);
	while true do
		begin
			readln(n,v);
			if (n=v)and(n=0) then break;
			fillchar(f,sizeof(f),0);f[0]:=true;
			ans:=0;
			for i:=1 to n do read(a[i]);
			for i:=1 to n do read(c[i]);
			for i:=1 to n do mutipack(a[i],c[i]);
			writeln(ans);
		End;
	close(output);
End.

