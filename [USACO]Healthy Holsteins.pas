{
id:rz109291
PROG:holstein
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: holstein
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
   Test 10: TEST OK [0.081 secs, 276 KB]

All tests OK.
YOUR PROGRAM ('holstein') WORKED FIRST TIME!  That's fantastic
-- and a rare thing.  Please accept these special automated
congratulations.
}
var
	i,j,m,n,v,g,limit:longint;
	a:array[0..16,0..30]of longint;
	b,ans:array[0..30]of longint;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
procedure check;
var
	i,j:longint;
	x:array[0..50]of longint;
	bol:boolean;
begin
	fillchar(x,sizeof(x),0);
	for j:=1 to v do
		for i:=1 to n do
			x[j]:=x[j]+a[ans[i],j];
	bol:=true;
	for i:=1 to v do
		if x[i]<b[i] then
			bol:=false;
	if bol then
		begin
			dec(n);
			write(n,' ');
			for i:=1 to n-1 do
				write(ans[i],' ');
			writeln(ans[n]);
			close(input);close(output);
			halt;
		end;
end;
procedure dfsid(j,p:longint);
var
	k,low,hi:longint;
begin
	if (p>limit)then exit;
	low:=n;
	hi:=min(g,g-limit+n);
	if low<=j then low:=j+1;
	for k:=low to hi do
		begin
			ans[n]:=k;
			inc(n);
			if n=limit+1 then check;
			dfsid(k,n);
			dec(n);
		end;
end;
begin
	assign(input,'holstein.in');reset(input);
	assign(output,'holstein.out');rewrite(output);
	readln(v);
	for i:=1 to v do
		read(b[i]);
	readlN(g);
	for i:=1 to g do
		for j:=1 to v do
			read(a[i,j]);
	limit:=0;
	while true do
		begin
			inc(limit);
			n:=1;//要搜第n个
			dfsid(0,0);//第i-1个数在其搜索范围内是第j个,已搜p个
		end;
end.
