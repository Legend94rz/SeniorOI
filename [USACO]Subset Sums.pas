{
id:rz109291
PROG:subset
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: subset
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 420 KB]
   Test 2: TEST OK [0.000 secs, 420 KB]
   Test 3: TEST OK [0.000 secs, 420 KB]
   Test 4: TEST OK [0.000 secs, 420 KB]
   Test 5: TEST OK [0.000 secs, 420 KB]
   Test 6: TEST OK [0.000 secs, 420 KB]
   Test 7: TEST OK [0.000 secs, 420 KB]

All tests OK.
Your program ('subset') produced all correct answers!  This is your
submission #2 for this problem.  Congratulations!
}
var
	a:array[0..40]of longint;
	i,j,n,m:longint;
	sum:longint;
	f:array[0..40,0..450]of int64;
begin
	assign(input,'subset.in');reset(input);assign(output,'subset.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		inc(sum,i);
	if (sum mod 2<>0) then begin
		writeln(0);
		close(input);
		close(output);
		halt;
	end;
	f[1,0]:=1;f[1,1]:=1;
	for i:=2 to n do
		for j:=0 to sum do
			if j>=i then
				f[i,j]:=f[i-1,j-i]+f[i-1,j]
			else
				f[i,j]:=f[i-1,j];
	{for j:=1 to n do
		write(f[j],' ');
	writeln;}
	writeln(f[n,sum div 2]div 2);
	close(input);close(output);
end.
