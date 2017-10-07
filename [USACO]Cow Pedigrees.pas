{
PROG:nocows
LANG:PASCAL
id:rz109291
}
{
USER: r z [rz109291]
TASK: nocows
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 356 KB]
   Test 2: TEST OK [0.000 secs, 356 KB]
   Test 3: TEST OK [0.000 secs, 356 KB]
   Test 4: TEST OK [0.000 secs, 356 KB]
   Test 5: TEST OK [0.000 secs, 356 KB]
   Test 6: TEST OK [0.000 secs, 356 KB]
   Test 7: TEST OK [0.027 secs, 356 KB]
   Test 8: TEST OK [0.027 secs, 356 KB]
   Test 9: TEST OK [0.027 secs, 356 KB]
   Test 10: TEST OK [0.027 secs, 356 KB]
   Test 11: TEST OK [0.081 secs, 356 KB]
   Test 12: TEST OK [0.027 secs, 356 KB]

All tests OK.
Your program ('nocows') produced all correct answers!  This is your
submission #2 for this problem.  Congratulations!
}
var
	x,k,i,j,p:longint;
	f:array[-1..201,-1..101]of longint;
begin
	assign(input,'nocows.in');reset(input);assign(output,'nocows.out');rewrite(output);
	readln(x,k);
	for i:=1 to k do
		f[1,i]:=1;
	for i:=1 to x do
		for j:=1 to k do
			for p:=1  to i-2 do
				f[i,j]:=(f[i,j]+f[p,j-1]*f[i-1-p,j-1])mod 9901;
	writeln((f[x,k]+9901-f[x,k-1])mod 9901);
	close(output);close(input);
end.
