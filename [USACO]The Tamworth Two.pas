{
id:rz109291
PROG:ttwo
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: ttwo
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 276 KB]
   Test 2: TEST OK [0.000 secs, 276 KB]
   Test 3: TEST OK [0.027 secs, 276 KB]
   Test 4: TEST OK [0.000 secs, 276 KB]
   Test 5: TEST OK [0.000 secs, 276 KB]
   Test 6: TEST OK [0.027 secs, 276 KB]
   Test 7: TEST OK [0.000 secs, 276 KB]
   Test 8: TEST OK [0.027 secs, 276 KB]
   Test 9: TEST OK [0.000 secs, 276 KB]

All tests OK.
Your program ('ttwo') produced all correct answers!  This is your
submission #2 for this problem.  Congratulations!

Here are the test data inputs:
}
var
	s:array[0..11]of string;
	i,t,j:longint;
	mlocx,clocx,mlocy,clocy:integer;
	d:longint;
	dx:array[1..5]of -1..1=(-1,0,1,0,0);
	dy:array[1..5]of -1..1=(0,1,0,-1,0);
	ccurd,mcurd:1..5;
begin
	assign(input,'ttwo.in');assign(output,'ttwo.out');reset(input);rewrite(output);
	for i:=1 to 10 do
		begin
			readln(s[i]);
			if(pos('F',s[i])<>0)then begin mlocx:=i;mlocy:=pos('F',s[i]);end;
			if(pos('C',s[i])<>0)then begin clocx:=i;clocy:=pos('C',s[i]);end;
		end;
	ccurd:=1;mcurd:=1;
	for i:=1 to 1000000 do
	begin
		if(s[mlocx+dx[mcurd],mlocy+dy[mcurd]]<>'*')and(mlocx+dx[mcurd]<=10)and(mlocx+dx[mcurd]>=1)and(mlocy+dy[mcurd]<=10)and(mlocy+dy[mcurd]>=1)then
			begin
				mlocx:=mlocx+dx[mcurd];
				mlocy:=mlocy+dy[mcurd];
			end
		else
			begin
				inc(mcurd);if (mcurd>4)then mcurd:=1;
			end;
		if(s[clocx+dx[ccurd],clocy+dy[ccurd]]<>'*')and(clocx+dx[ccurd]<=10)and(clocx+dx[ccurd]>=1)and(clocy+dy[ccurd]<=10)and(clocy+dy[ccurd]>=1)then
			begin
				clocx:=clocx+dx[ccurd];clocy:=clocy+dy[ccurd];
			end
		else
			begin
				inc(ccurd);if (ccurd>4)then ccurd:=1;
			end;
		inc(t);
		if(clocx=mlocx)and(clocy=mlocy)then begin writeln(t);break;end;
	end;
	if(i=1000000)then writeln(0);
	close(input);close(output);
end.
