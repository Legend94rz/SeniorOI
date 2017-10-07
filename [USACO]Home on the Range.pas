{
id:rz109291
PROG:range
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: range
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 808 KB]
   Test 2: TEST OK [0.000 secs, 808 KB]
   Test 3: TEST OK [0.000 secs, 808 KB]
   Test 4: TEST OK [0.000 secs, 808 KB]
   Test 5: TEST OK [0.000 secs, 808 KB]
   Test 6: TEST OK [0.000 secs, 808 KB]
   Test 7: TEST OK [0.000 secs, 808 KB]

All tests OK.
Your program ('range') produced all correct answers!  This is your
submission #5 for this problem.  Congratulations!
}
var
	n,m,i,j,k,t:longint;
	g:array[0..300,0..300]of char;
	f:array[0..300,0..300]of longint;
	ans:array[0..300]of longint;
	neednt:array[0..300,0..300] of boolean;
begin
	assign(input,'range.in');reset(input);assign(output,'range.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		begin
		for j:=1 to n do
			read(g[i,j]);
		readln;
		end;
	fillchar(f,sizeof(f),0);
	for i:=1 to n do
		for j:=1 to n do
			if g[i,j]='1' then
			begin
				k:=f[i-1,j];
				if k>f[i-1,j-1] then k:=f[i-1,j-1];
				if k>f[i,j-1] then k:=f[i,j-1];
				f[i,j]:=k+1;
			end;
	for i:=1 to n do
		for j:=1 to n do
			inc(ans[f[i,j]]);
	for i:=1 to n do
		for j:=i+1 to n do
			if (ans[i]>0) and (ans[j]>0) then
				inc(ans[i],ans[j]);
	for i:=2 to n do
		if ans[i]>0 then
			writeln(i,' ',ans[i]);
	close(input);close(output);
end.
