{
id:rz109291
PROG:inflate
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: inflate
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 508 KB]
   Test 2: TEST OK [0.000 secs, 508 KB]
   Test 3: TEST OK [0.000 secs, 508 KB]
   Test 4: TEST OK [0.000 secs, 508 KB]
   Test 5: TEST OK [0.000 secs, 508 KB]
   Test 6: TEST OK [0.027 secs, 508 KB]
   Test 7: TEST OK [0.081 secs, 508 KB]
   Test 8: TEST OK [0.243 secs, 508 KB]
   Test 9: TEST OK [0.351 secs, 508 KB]
   Test 10: TEST OK [0.324 secs, 508 KB]
   Test 11: TEST OK [0.000 secs, 508 KB]
   Test 12: TEST OK [0.000 secs, 508 KB]

All tests OK.
YOUR PROGRAM ('inflate') WORKED FIRST TIME!  That's fantastic
-- and a rare thing.  Please accept these special automated
congratulations.
}
var
	value,cost,f:array[0..20000]of longint;
	i,j,n,m,v:longint;
begin
	assign(input,'inflate.in');reset(input);assign(output,'inflate.out');rewrite(output);
	readln(v,n);
	for i:=1 to n do
		readln(value[i],cost[i]);
	for i:=1 to n do
		for j:=cost[i] to v do
			if f[j]<f[j-cost[i]]+value[i] then
				f[j]:=f[j-cost[i]]+value[i];
	writeln(f[v]);
	close(input);close(output);
end.
