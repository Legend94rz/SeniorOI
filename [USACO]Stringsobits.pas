{
id:rz109291
PROG:kimbits
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: kimbits
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 288 KB]
   Test 2: TEST OK [0.000 secs, 288 KB]
   Test 3: TEST OK [0.000 secs, 288 KB]
   Test 4: TEST OK [0.000 secs, 288 KB]
   Test 5: TEST OK [0.000 secs, 288 KB]
   Test 6: TEST OK [0.000 secs, 288 KB]
   Test 7: TEST OK [0.000 secs, 288 KB]
   Test 8: TEST OK [0.000 secs, 288 KB]
   Test 9: TEST OK [0.000 secs, 288 KB]
   Test 10: TEST OK [0.000 secs, 288 KB]
   Test 11: TEST OK [0.000 secs, 288 KB]
   Test 12: TEST OK [0.000 secs, 288 KB]
   Test 13: TEST OK [0.000 secs, 288 KB]

All tests OK.
Your program ('kimbits') produced all correct answers!  This is your
submission #2 for this problem.  Congratulations!
}
var
	f:array[0..40,0..40]of int64;
	i,j,n,l,m:longint;
	k:int64;
begin
	assign(input,'kimbits.in');reset(input);assign(output,'kimbits.out');rewrite(output);
	readln(n,m,k);
	for i:=0 to n do
		begin
			f[i,0]:=1;
			f[0,i]:=1;
		end;
	for i:=1 to n do
		for j:=1 to m do
			f[i,j]:=f[i-1,j]+f[i-1,j-1];
	for i:=n-1 downto 0 do
		if f[i,m]<k then
			begin
				write('1');
				dec(k,f[i,m]);
				dec(m);
			end
		else
			write('0');
	writeln;
	close(output);close(input);
end.
