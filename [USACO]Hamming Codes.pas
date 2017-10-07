{
id:rz109291
PROG:hamming
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: hamming
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 276 KB]
   Test 2: TEST OK [0.000 secs, 276 KB]
   Test 3: TEST OK [0.000 secs, 276 KB]
   Test 4: TEST OK [0.000 secs, 276 KB]
   Test 5: TEST OK [0.000 secs, 276 KB]
   Test 6: TEST OK [0.000 secs, 276 KB]
   Test 7: TEST OK [0.000 secs, 276 KB]
   Test 8: TEST OK [0.000 secs, 276 KB]
   Test 9: TEST OK [0.000 secs, 276 KB]
   Test 10: TEST OK [0.000 secs, 276 KB]
   Test 11: TEST OK [0.000 secs, 276 KB]

All tests OK.
YOUR PROGRAM ('hamming') WORKED FIRST TIME!  That's fantastic
-- and a rare thing.  Please accept these special automated
congratulations.
}
var
	n,b,d,m,i,j:longint;
	bol:boolean;
	f:array[0..300]of byte;
function judge(k:longint):boolean;
var
	i:longint;
begin
	i:=0;
	while k >0 do
		begin
			if k and 1=1 then
				inc(i);
			k:=k shr 1;
		end;
	exit(i>=d);
end;	
begin
	assign(input,'hamming.in');reset(input);assign(output,'hamming.out');rewrite(output);
	readlN(n,b,d);
	f[0]:=1;f[1]:=0;
	repeat
		inc(i);
		bol:=true;
		for j:=1 to f[0] do
			bol:=bol and (judge(i xor f[j]));
		if bol then
			begin
			inc(f[0]);
			f[f[0]]:=i;
			end;
	until f[0]=n;
	for i:=1 to f[0] do
		begin
		write(f[i]);
		if (i mod 10 = 0)or(i=f[0]) then
			writeln
		else
			write(' ');	
		end;
	close(input);close(output);
end.
