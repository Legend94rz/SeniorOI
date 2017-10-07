{
ID:rz109291
PROG:numtri
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: numtri
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 4196 KB]
   Test 2: TEST OK [0.000 secs, 4196 KB]
   Test 3: TEST OK [0.000 secs, 4196 KB]
   Test 4: TEST OK [0.000 secs, 4196 KB]
   Test 5: TEST OK [0.000 secs, 4196 KB]
   Test 6: TEST OK [0.000 secs, 4196 KB]
   Test 7: TEST OK [0.027 secs, 4196 KB]
   Test 8: TEST OK [0.000 secs, 4196 KB]
   Test 9: TEST OK [0.405 secs, 4196 KB]

All tests OK.
YOUR PROGRAM ('numtri') WORKED FIRST TIME!  That's fantastic
-- and a rare thing.  Please accept these special automated
congratulations.
}
var
	i,j,n:longint;
	a:array[0..1001,0..1001]of longint;
begin
	ASSIGN(input,'numtri.in');reset(input);assign(output,'numtri.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		for j:=1 to i do
			read(a[i,j]);
	for I:=n-1 downto 1 do
		for j:=1 to i do
			if (a[i+1,j]>a[I+1,j+1]) then
				inc(a[i,j],a[i+1,j])
			else
				inc(a[i,j],a[i+1,j+1]);
	writeln(a[1,1]);
	close(input);close(output);
end.
