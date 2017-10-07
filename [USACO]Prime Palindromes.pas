{
id:rz109291
PROG:pprime
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: pprime
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
   Test 7: TEST OK [0.027 secs, 276 KB]
   Test 8: TEST OK [0.027 secs, 276 KB]
   Test 9: TEST OK [0.081 secs, 276 KB]

All tests OK.
Your program ('pprime') produced all correct answers!  This is your
submission #2 for this problem.  Congratulations!
出现过诡异错误：运行结果与输出文件结果不一致(已纠正，但原因不明)
}
var
	i,j,n,a,b,t:longint;
	s,sa,sb:string;
function isprime(k:string):boolean;
var
	i,code:longint;
	//t:longint;
begin
	val(k,t,code);
	//writeln(t,' ',code);
	if(t<a)or(t>b) then exit(false);
	//if (k<sa)or(k>sb)then exit(false);
	if t<2 then exit(false);
	for i:=2 to trunc(sqrt(t)) do
		if t mod i =0 then
			exit(false);
	exit(true);
end;
procedure dfs(i:longint);
var
	k:longint;
	j:char;
begin
	if (i>n div 2+1)and(n mod 2 =1)or(i>n div 2)and(n mod 2=0) then exit;
	for j:='0' to '9' do
		if (i=1)and(j in['0','2','4','6','8'])and(n<>1) then
			continue
		else
			begin
				s[i]:=j;
				s[n-i+1]:=j;
				if (i=n div 2+1)and(n mod 2=1)or(i=n div 2)and(n  mod 2=0) then
					begin
					if isprime(s) then
						writeln(s);
					end;
				dfs(i+1);
			end;
end;
begin
	assign(input,'pprime.in');reset(input);
	assign(output,'pprime.out');rewrite(output);
	readln(a,b);
	str(a,sa);
	str(b,sb);
	for n:=length(sa) to length(sb) do
		begin
			s:='';
			for i:=1 to n do
				s:=s+'0';
			dfs(1);
		end;
	close(input);
	close(output);
end.
