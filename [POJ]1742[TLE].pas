program poj1742;
{
��Ŀ������
����n��Ӳ�ң�֪��ÿ�ֵ���ֵa[i]��ÿ�ֵ�����c[i]��
�����ܴճ������ֲ�����m����ֵ��
n <= 100, a[i] <= 100000, c[i] <= 1000      1<=i<=n
m<=10000
���ⱨ�棺
vst[i]��ʾ�Ƿ��ܹ��ճ�i��ֵ�� 0<=i<=m
��ʼʱ��vst[0] = 1,������Ϊ0
dp[i][j]   1<=i<=m 0<=j<=1
dp[i][0] ��ʾ�ճ�i��ֵ�����һöӲ������һ�֣��ֺ�Ĭ��Ϊ�����˳��1~n).
dp[i][1] ��ʾdp[i][0]����Ӳ���Ѿ����˼�ö�ˡ�
Ȼ�����ζ�n��Ӳ��ɨ�裨��һ��forѭ����
����ÿ��Ӳ��i���ñ���j ɨ��a[i]~m����
���vst[j - a[i]] == 1 ���� vst[j] == 0
��ô�п��ܿ�����һö��СΪa[i]��Ӳ����j - a[i]��ϣ�����j��ֵ��
�������j - a[i]��������Ѿ�����c[i]öa[i]����ôa[i]�Ͳ��ܺ�j - a[i]����ˡ�
����������dp�Ķ��塣
��dp[j - a[i]][0] == i ����dp[j - a[i]][1] == c[i]ʱ���㲻����ϡ�
����vst[j - a[i]] == 1 ���� vst[j] == 0 ���� ����dp[j - a[i]][0] == i ����dp[j - a[i]][1] == c[i]��
��ʱ��vst[j]���Ը���Ϊ1.
ͬʱΪ��ά��dp�Ķ��壺
���dp[j - a[i]][0] != i.
��dp[j][0] = i�� dp[j][1] = 1;
����dp[j][1] = dp[j - a[i]][1] + 1 // ��j - a[i]������϶���һöa[i]
 
�������£��̣ܶ�
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

