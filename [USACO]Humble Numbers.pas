{
id:rz109291
PROG:humble
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: humble
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 1452 KB]
   Test 2: TEST OK [0.000 secs, 1452 KB]
   Test 3: TEST OK [0.000 secs, 1452 KB]
   Test 4: TEST OK [0.000 secs, 1452 KB]
   Test 5: TEST OK [0.000 secs, 1452 KB]
   Test 6: TEST OK [0.027 secs, 1452 KB]
   Test 7: TEST OK [0.000 secs, 1452 KB]
   Test 8: TEST OK [0.000 secs, 1452 KB]
   Test 9: TEST OK [0.000 secs, 1452 KB]
   Test 10: TEST OK [0.000 secs, 1452 KB]
   Test 11: TEST OK [0.000 secs, 1452 KB]
   Test 12: TEST OK [0.108 secs, 1452 KB]

All tests OK.
YOUR PROGRAM ('humble') WORKED FIRST TIME!  That's fantastic
-- and a rare thing.  Please accept these special automated
congratulations.
}
var
	index:array[0..1000]of longint;
	p:array[0..300]of longint;
	last:longint;
	table:array[0..300000]of longint;
	k,n,i,j,min,x,y,z:longint;
begin
	assign(input,'humble.in');reset(input);assign(output,'humble.out');rewrite(output);
	readlN(k,n);//4 19
	last:=1;
	table[1]:=1;
	for i:=1 to k do
		begin
		read(p[i]);
		index[p[i]]:=1;		
		end;
	for i:=2 to n+1 do//2-20
		begin
			min:=maxlongint;
			for j:=1 to k do
				begin
					while p[j]*table[index[p[j]]]<=last do
						inc(index[p[j]]);
					if p[j]*table[index[p[j]]]<min then
						min:=p[j]*table[index[p[j]]];
				end;
			last:=min;
			table[i]:=min;
		end;
	writeln(min);
	close(output);close(input);
end.
