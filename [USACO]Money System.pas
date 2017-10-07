{
id:1z109291
PROG:money
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: money
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 352 KB]
   Test 2: TEST OK [0.000 secs, 352 KB]
   Test 3: TEST OK [0.000 secs, 352 KB]
   Test 4: TEST OK [0.000 secs, 352 KB]
   Test 5: TEST OK [0.000 secs, 352 KB]
   Test 6: TEST OK [0.000 secs, 352 KB]
   Test 7: TEST OK [0.000 secs, 352 KB]
   Test 8: TEST OK [0.000 secs, 352 KB]
   Test 9: TEST OK [0.000 secs, 352 KB]
   Test 10: TEST OK [0.000 secs, 352 KB]
   Test 11: TEST OK [0.000 secs, 352 KB]
   Test 12: TEST OK [0.000 secs, 352 KB]
   Test 13: TEST OK [0.000 secs, 352 KB]

All tests OK.
YOUR PROGRAM ('money') WORKED FIRST TIME!  That's fantastic
-- and a rare thing.  Please accept these special automated
congratulations.
}
var
	i,j,n,m,v:longint;
	f:array[0..10001]of int64;
	a:array[0..30]of longint;
begin
	assign(input,'money.in');reset(input);assign(output,'money.out');rewrite(output);
	readln(v,n);
	for i:=1 to v do
		read(a[i]);
	f[0]:=1;
	for i:=1 to v do
		for j:=a[i] to n do
			f[j]:=f[j]+f[j-a[i]];
	writeln(f[n]);
	close(input);close(output);
end.
