{
id:109291
PROG:sprime
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: sprime
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 276 KB]
   Test 2: TEST OK [0.000 secs, 276 KB]
   Test 3: TEST OK [0.000 secs, 276 KB]
   Test 4: TEST OK [0.000 secs, 276 KB]
   Test 5: TEST OK [0.000 secs, 276 KB]

All tests OK.
Your program ('sprime') produced all correct answers!  This is your
submission #2 for this problem.  Congratulations!
}
const
	b:array[1..6]of 1..9 =(1,2,3,5,7,9);
var
	i,j,n:longint;
	s:string;
function isprime(t:longint):boolean;
var
	i:longint;
begin
	if t<2 then exit(false);
	for i:=2 to trunc(sqrt(t)) do
		if t mod i =0 then
			exit(false);
	exit(true);
end;
procedure dfs(i,r:longint);
var
	k:longint;
	t:longint;
	bol:boolean;
begin
	if(i>n)then exit;
	for k:=1 to 6 do
		begin
			t:=r;
			r:=10*r+b[k];
			{if (i<>1)and(k=2) then
				continue;}
			bol:=isprime(r);
			//writeln(i,' ',r);
			if not bol then
				begin
					r:=t;
					continue;
				end
			else
				if bol and(i=n) then
					writeln(r);
			dfs(i+1,r);
			r:=t;
		end;
end;
begin
	assign(input,'sprime.in');reset(input);
	assign(output,'sprime.out');rewrite(output);
	readlN(n);
	dfs(1,0);
	close(output);
	close(input);
end.
