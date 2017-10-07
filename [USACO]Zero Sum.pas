{
id:rz019291
PROG:zerosum
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: zerosum
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

All tests OK.
YOUR PROGRAM ('zerosum') WORKED FIRST TIME!  That's fantastic
-- and a rare thing.  Please accept these special automated
congratulations.
}
const
	//s:string=('1 2 3 4 5 6 7 8 9');
	x:array[0..2]of char=(' ','+','-');
var
	n,ans,i:longint;
        s:string;
	b:array[0..9]of char;
	c:array[1..9]of longint;
function cal(m:string):longint;
vaR
	u,j,w,code:integer;
	e,f:longint;
begin
	cal:=0;
	w:=0;
	for j:=1 to length(m) do
		if(m[j]=' ')or(m[j]='.')then delete(m,j,1);
	for j:=1 to length(m) do if(m[j]='+')or(m[j]='-')then begin w:=j;break;end;
		if(w=0)then w:=length(m);
	val(copy(m,1,w-1),e,code);
	cal:=e;
	for u:=w+1 to length(m) do
	begin
		if (m[u]='+')or(m[u]='-')then
		begin
			j:=u;
			val(copy(m,w+1,j-w-1),f,code);
			if (m[w]='+')then
				cal:=cal+f
			else
				cal:=cal-f;
		end;
		w:=j;
	end;
	val(copy(m,w+1,length(m)-w),f,code);
	if (m[w]='+')then
		cal:=cal+f
	else
		cal:=cal-f;
end;
procedure dfs(i:longint;str:string);
var
	k,p,t,z,sum:longint;
	st:string;
	j:byte;
begin
	sum:=0;
	if (i>n-1)then exit;
	for k:=0 to 2 do
		begin
			st:=str;
			str[i]:=x[k];
			sum:=cal(str);
			if (sum=0)and(i=n-1) then {inc(ans);}writeln(str);
			dfs(i+2,str);
			str:=st;
		end;
end;
begin
	assign(input,'zerosum.in');reset(input);assign(output,'zerosum.out');rewrite(output);
	readln(n);
	for i:=1 to n-1 do
		s:=s+chr(ord(i)+48)+' ';
	s:=s+chr(ord(n)+48);
        n:=length(s);
	dfs(2,s);
	//writeln(ans);
	close(input);close(output);
end.
