{
id:rz019291
PROG:rockers
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: rockers
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 392 KB]
   Test 2: TEST OK [0.000 secs, 392 KB]
   Test 3: TEST OK [0.000 secs, 392 KB]
   Test 4: TEST OK [0.000 secs, 392 KB]
   Test 5: TEST OK [0.000 secs, 392 KB]
   Test 6: TEST OK [0.000 secs, 392 KB]
   Test 7: TEST OK [0.000 secs, 392 KB]
   Test 8: TEST OK [0.000 secs, 392 KB]
   Test 9: TEST OK [0.000 secs, 392 KB]
   Test 10: TEST OK [0.000 secs, 392 KB]
   Test 11: TEST OK [0.000 secs, 392 KB]
   Test 12: TEST OK [0.000 secs, 392 KB]

All tests OK.
Your program ('rockers') produced all correct answers!  This is your
submission #4 for this problem.  Congratulations!
}
var
	f:array[0..30,0..30,0..30]of longint;//f[i,j,k]表示用i个歌曲制造j张光盘还剩下k分钟时的用歌曲的数目
	i,j,k,n,m,t:longint;
	a:array[0..100]of longint;
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
begin
	assigN(input,'rockers.in');reset(input);assign(output,'rockers.out');rewrite(output);
	readln(n,t,m);
	for i:=1 to n do
		begin
			inc(j);
			read(a[j]);
			if a[j]>t then dec(j);		
		end;
	n:=j;
	for i:=1 to n do//n首歌
		for j:=0 to m do//m张CD
			for k:=0 to t do//一张CD可以容纳t分钟
				if a[i]<=k then
					f[i,j,k]:=max(f[i-1,j,k-a[i]]+1,f[i-1,j,k])
					//f[i-1,j,k-a[i]]+1 表示i-1首歌，制造j张CD，还有k-a[i]]分钟最多可以制造f[i-1,j,k-a[i]]再加上第i首歌
					//或者不用第i首歌，则剩下i-1首歌，制造j张CD，还有k分钟的状态f[i-1,j,k]
				else
					if j>0 then
						f[i,j,k]:=max(f[i-1,j-1,t-a[i]]+1,f[i-1,j,k])
					//如果剩下的k分钟装不下第i首歌，则考虑如果有CD的情况
					//f[i-1,j-1,t-a[i]]+1 表示i-1首歌，制造j-1张CD，还有t-a[i]分钟最多可以制造f[i-1,j-1,t-a[i]]再加上第i首歌
					//f[i-1,j,k] 同上
					else
						f[i,j,k]:=f[i-1,j,k];//f[i-1,j,k] 同上
	writelN(f[n,m,0]);
	close(input);close(output);
end.
