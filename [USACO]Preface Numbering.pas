{
di:rz109291
PROG:preface
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: preface
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
Your program ('preface') produced all correct answers!  This is your
submission #2 for this problem.  Congratulations!
}
type
	list=(I,V,X,L,C,D,M);
const
	range:array[1..4,1..2]of list=((i,x),(x,c),(c,m),(m,m));
	num5:array[1..4]of list=(v,l,d,d);
	num1:array[1..4]of list=(i,x,c,m);
var
	j:list;
	k,ii:longint;
	p:longint;
	f:array[I..M]of longint=(1,5,10,50,100,500,1000);
	a:array[I..m]of longint;
	n,r,z:integer;
	S:string;
begin
	assign(input,'preface.in');reset(input);assign(output,'preface.out');rewrite(output);
	readln(n);
	for p:=1 to n do
	begin
		str(p,s);
		k:=1;
		for ii:=length(s) downto 1 do
			begin
				case s[ii] of
				'0':continue;
				'1'..'3':inc(a[num1[k]],ord(s[ii])-ord('0'));
				'4'..'8':begin
						inc(a[num5[k]]);
						inc(a[num1[k]],abs(ord(s[ii])-ord('0')-5));
						end;
				'9':begin
					inc(a[num1[k+1]]);
					inc(a[num1[k]]);
					end;
				end;
				inc(k);
			end;
	end;
	for j:=i to m do
		if a[j]<>0 then
			writeln(j,' ',a[j]);
	close(input);close(output);
end.
