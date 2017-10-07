{
id:rz109291
PROG:fence
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: fence
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 2824 KB]
   Test 2: TEST OK [0.000 secs, 2824 KB]
   Test 3: TEST OK [0.000 secs, 2824 KB]
   Test 4: TEST OK [0.000 secs, 2824 KB]
   Test 5: TEST OK [0.000 secs, 2824 KB]
   Test 6: TEST OK [0.000 secs, 2824 KB]
   Test 7: TEST OK [0.000 secs, 2824 KB]
   Test 8: TEST OK [0.000 secs, 2824 KB]

All tests OK.
Your program ('fence') produced all correct answers!  This is your
submission #7 for this problem.  Congratulations!
}
var
	g:array[0..800,0..800]of longint;
	v:array[0..800]of longint;
	i,j,n,max:longint;
	x,y:longint;
	q:array[0..10000]of longint;
	r:longint;
	f:boolean;
procedure print;
var
	i:longint;
begin
	for i:=r downto 1 do
		writeln(q[i]);
	halt;
end;
procedure dfs(i:longint);
var
	j:longint;
begin
	for j:=1 to max do
		if g[i,j]>0 then
			begin
				dec(g[i,j]);dec(g[j,i]);
				dfs(j);
			end;
	inc(r);q[r]:=i;
end;
begin
	assign(input,'fence.in');reset(input);assign(output,'fence.out');rewrite(output);
	readln(n);
	for I:=1 to n do
		begin
			readln(x,y);
			if x>max then max:=x;
			if y>max then max:=y;
			inc(v[x]);
			inc(v[y]);
			inc(g[x,y]);
			inc(g[y,x]);
		end;
	for i:=1 to max do
		if v[i]mod 2 =1 then
			begin
				f:=true;
				break;
			end;
	if not f then i:=1;
	dfs(i);print;
	close(input);close(output);
end.
