{
id:rz109291
PROG:runround
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: runround
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 276 KB]
   Test 2: TEST OK [0.000 secs, 276 KB]
   Test 3: TEST OK [0.000 secs, 276 KB]
   Test 4: TEST OK [0.000 secs, 276 KB]
   Test 5: TEST OK [0.054 secs, 276 KB]
   Test 6: TEST OK [0.027 secs, 276 KB]
   Test 7: TEST OK [0.108 secs, 276 KB]

All tests OK.
Your program ('runround') produced all correct answers!  This is your
submission #4 for this problem.  Congratulations!
}
var
	i,j,n:longint;
function check(i:longint):boolean;
var
	k,t,y,j:longint;
	s:string;
	bol:array[0..20]of boolean;
	last:char;
	bl:array['0'..'9']of boolean;
begin
	str(i,s);
	fillchar(bol,sizeof(bol),0);
	fillchar(bl,sizeof (bl),0);
	for k:=1 to length(s) do
		if not bl[s[k]] then
			bl[s[k]]:=true
		else
			exit(false);
	bol[0]:=true;
	k:=1;
	j:=0;last:=s[1];
	repeat
		t:=ord(s[k])-ord('0');
		if t=0 then exit(false);
		y:=(k+t) mod length(s);
		if y=0 then y:=length(s);
		//writeln(t,' ',y);
		if not bol[y] then
			bol[y]:=true
		else
			exit(false);
		k:=y;
		if last<>s[k] then last:=s[k]
		else
			exit(false);
		inc(j);
	until (j>=length(s))or(y=1);
	for k:=1 to length(s) do
		if (not bol[k]) then
			exit(false);
	if (s[y]=s[1])then
		exit(true)
	else
		exit(false);
end;
begin
	assign(input,'runround.in');reset(input);assign(output,'runround.out');rewrite(output);
	readlN(n);
	for i:=n+1 to maxlongint do
		if check(i) then
			begin
				writeln(i);
				close(input);
				close(output);
				halt;
			end;
	//writeln(check(n));
end.
