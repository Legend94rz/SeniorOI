{
id:rz109291
PROG:stamps
LANG:PASCAL
}
{
这道题的难点主要有2：
1.题目中没有说出“背包的体积”和“背包价值”，需要自己构造。一个优等的构造方法是：h:=k*max(a[i]);
2.体积循环应该在外面。因为对于每个体积，所有物品都要循环一遍以挑选出最优，和平时的背包模型不一样.
方程：f[v]:=min(f[v],f[v-cost[i]]+1);
我一开始沙茶般的让价值为COST[I],体积为K，占用为1.然后处理起来非常麻烦。
看来，背包模型的难点不只是发现背包，还有背包的构造。
}
{
USER: r z [rz109291]
TASK: stamps
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 8132 KB]
   Test 2: TEST OK [0.000 secs, 8132 KB]
   Test 3: TEST OK [0.000 secs, 8132 KB]
   Test 4: TEST OK [0.000 secs, 8132 KB]
   Test 5: TEST OK [0.000 secs, 8132 KB]
   Test 6: TEST OK [0.000 secs, 8132 KB]
   Test 7: TEST OK [0.000 secs, 8132 KB]
   Test 8: TEST OK [0.000 secs, 8132 KB]
   Test 9: TEST OK [0.000 secs, 8132 KB]
   Test 10: TEST OK [0.081 secs, 8132 KB]
   Test 11: TEST OK [0.756 secs, 8132 KB]
   Test 12: TEST OK [0.243 secs, 8132 KB]
   Test 13: TEST OK [0.000 secs, 8132 KB]

All tests OK.
YOUR PROGRAM ('stamps') WORKED FIRST TIME!  That's fantastic
-- and a rare thing.  Please accept these special automated
congratulations.
}
var
	f:array[0..2010000]of longint;
	a:array[0..2000]of longint;
	i,j,n,k,max,v:longint;
begin
	assign(input,'stamps.in');reset(input);assign(output,'stamps.out');rewrite(output);
	readln(k,n);
	for i:=1 to n do
		begin
		read(a[i]);
		if a[i]>max then
			max:=a[i];
		end;
	v:=max*k+1;
	for i:=1 to v do
		f[i]:=$3f3f3f3f;
	f[0]:=0;
	for j:=1 to v do
		begin
			for i:=1 to n do
				if (j>=a[i])then
					if(f[j]>f[j-a[i]]+1) then
				        f[j]:=f[j-a[i]]+1;
			if f[j]>k then
				begin
					writeln(j-1);
					close(input);close(output);halt;
				end;
		end;
end.
