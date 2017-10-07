{
id:rz109291
LANG:PASCAL
PROG:sort3
}
{
USER: r z [rz109291]
TASK: sort3
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

All tests OK.
Your program ('sort3') produced all correct answers!  This is your
submission #4 for this problem.  Congratulations!
}
var
	n,i,k:longint;
	ans:int64;
	a:array[0..1005]of byte;
	cnt,la:array[0..4]of longint;
begin
	assign(input,'sort3.in');reset(input);assign(output,'sort3.out');rewrite(output);
	readlN(n);
	for i:=1 to n do
		begin
			readlN(a[i]);
			inc(cnt[a[i]]);
		end;
	for i:=1 to cnt[1] do
		case a[i] of
		1:continue;
		2:for k:=cnt[1]+1 to n do
			if a[k]=1 then
				begin
					a[i]:=1;a[k]:=2;
					inc(ans);
					break;
				end;
		3:for k:=n downto cnt[1]+1 do
			if a[k]=1 then
				begin
					a[i]:=1;
					a[k]:=3;
					inc(ans);
					break;
				end;
		end;
	for i:=cnt[1]+1 to cnt[1]+cnt[2] do
		if a[i]=3 then
			begin
			inc(ans);
			end;
	writeln(ans);
	close(input);close(output);
end.
