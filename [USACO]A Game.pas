{
id:rz019291
LANG:PASCAL
PROG:game1
}
{
USER: r z [rz109291]
TASK: game1
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 8108 KB]
   Test 2: TEST OK [0.000 secs, 8108 KB]
   Test 3: TEST OK [0.000 secs, 8108 KB]
   Test 4: TEST OK [0.000 secs, 8108 KB]
   Test 5: TEST OK [0.000 secs, 8108 KB]
   Test 6: TEST OK [0.000 secs, 8108 KB]
   Test 7: TEST OK [0.000 secs, 8108 KB]
   Test 8: TEST OK [0.000 secs, 8108 KB]
   Test 9: TEST OK [0.000 secs, 8108 KB]
   Test 10: TEST OK [0.000 secs, 8108 KB]
   Test 11: TEST OK [0.000 secs, 8108 KB]
   Test 12: TEST OK [0.000 secs, 8108 KB]
   Test 13: TEST OK [0.000 secs, 8108 KB]
   Test 14: TEST OK [0.000 secs, 8108 KB]
   Test 15: TEST OK [0.000 secs, 8108 KB]
   Test 16: TEST OK [0.000 secs, 8108 KB]

All tests OK.
YOUR PROGRAM ('game1') WORKED FIRST TIME!  That's fantastic
-- and a rare thing.  Please accept these special automated
congratulations.
}
var
	f,sm:array[0..1000,0..1000]of longint;
	i,j:longint;
	n,m:longint;
	a:array[0..1000]of  longint;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
function sum(s,t:longint):longint;
var
	i:longint;
begin
	if sm[s,t]>0 then exit(sm[s,t]);
	sum:=0;
	for i:=s to t do
		inc(sum,a[i]);
end;
begin
	assign(input,'game1.in');reset(input);assign(output,'game1.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		read(a[i]);
	for i:=n downto 1 do
		for j:=i to n do
			f[i,j]:=sum(i,j)-min(f[i+1,j],f[i,j-1]);
	writeln(f[1,n],' ',sum(1,n)-f[1,n]);
	close(output);close(input);
end.
