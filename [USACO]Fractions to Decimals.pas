{
id:rz109291
PROG:fracdec
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: fracdec
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 4656 KB]
   Test 2: TEST OK [0.000 secs, 4656 KB]
   Test 3: TEST OK [0.000 secs, 4656 KB]
   Test 4: TEST OK [0.000 secs, 4656 KB]
   Test 5: TEST OK [0.000 secs, 4656 KB]
   Test 6: TEST OK [0.000 secs, 4656 KB]
   Test 7: TEST OK [0.000 secs, 4656 KB]
   Test 8: TEST OK [0.027 secs, 4656 KB]
   Test 9: TEST OK [0.000 secs, 4656 KB]

All tests OK.
Your program ('fracdec') produced all correct answers!  This is your
submission #5 for this problem.  Congratulations!
}
var
	n,d,zs,yu,sh:longint;
	s:array[0..102000]of longint;
	l,r,a,b,ta:longint;
	flag:boolean;
	ts:string;
	q:array[0..1020000]of longint;
begin
	assign(input,'fracdec.in');reset(input);assign(output,'fracdec.out');rewrite(output);
	readln(n,d);
	zs:=n div d;
	n:=(n - n div d*d)*10;
	inc(r);
	q[n]:=r;
	//sh:=zs;yu:=n;
	repeat
		sh:=n div d;
		yu:=n-sh*d;
		a:=q[yu*10];
		//writeln(n,' ',yu,' ',sh,' ',a,' ',r);
		if a=0 then
			begin
				inc(r);
				q[n]:=r;
			end
		else
			flag:=true;
		inc(ta);
		s[ta]:=sh;
		if flag then begin
			b:=r;
			break;
		end;
		n:=yu*10;
	until n=0;
	if a=0 then a:=1;
	if (b-a<=0)and(s[1]=0)and(s[2]=0)then flag:=false;
	//writeln('r=',r,' ','a=',a-1,'b=',b,' ',flag);
	str(zs,ts);
	write(zs,'.');
	zs:=length(ts)+1;
	if not flag then
		begin
			for l:=1 to ta do
			begin
				if zs mod 76<>0 then
					write(s[l])
				else
					begin
					writeln;
					zs:=0;
					end;
				inc(zs);
			end;
			writeln;
		end
	else
		for l:=1 to ta do
			begin
				if (l=a)and(a=1)or(l+1=a) then
				begin
				write('(');
				inc(zs);
				if zs=76 then
					begin
						writeln;
						zs:=0;
					end;
				end;
				write(s[l]);
				inc(zs);
				if zs=76 then begin writeln;zs:=0;end;
				if (l=b)then writeln(')');
			//inc(zs);
			end;
	close(input);close(output);
end.
