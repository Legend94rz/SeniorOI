{
id:rz1092391
PROG:concom
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: concom
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 316 KB]
   Test 2: TEST OK [0.000 secs, 316 KB]
   Test 3: TEST OK [0.000 secs, 316 KB]
   Test 4: TEST OK [0.000 secs, 316 KB]
   Test 5: TEST OK [0.000 secs, 316 KB]
   Test 6: TEST OK [0.000 secs, 316 KB]
   Test 7: TEST OK [0.000 secs, 316 KB]
   Test 8: TEST OK [0.000 secs, 316 KB]
   Test 9: TEST OK [0.000 secs, 316 KB]

All tests OK.
Your program ('concom') produced all correct answers!  This is your
submission #4 for this problem.  Congratulations!
}
var
	ck:array[0..101]of longint;
	s:array[0..101,0..101]of longint;
	i,j,n,x,y,z,m:longint;
	vis,own:array[0..101]of boolean;
procedure dfs(k:byte);
var
	i,j:byte;
begin
	if vis[k] then exit;
	vis[k]:=true;
	for i:=1 to m do
		begin
		inc(ck[i],s[k,i]);
		if ck[i]>=50 then
			begin
				dfs(i);
				own[i]:=true;
			end;
		end;
end;
begin
	assign(input,'concom.in');reset(input);assign(output,'concom.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		begin
			readln(x,y,z);
			inc(s[x,y],z);
			if x>m then
				m:=x;
			if y>m then
				m:=y;
		end;
	for i:=1 to m do
		begin
			fillchar(ck,sizeof(ck),0);
			fillchar(vis,sizeof(vis),0);
			fillchar(own,sizeof(own),0);
			dfs(i);
			for x:=1 to m do
				if (own[x])and(i<>x) then
					writeln(i,' ',x);
		end;
	close(input);close(output);
end.
