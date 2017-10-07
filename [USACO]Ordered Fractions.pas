{
id:rz109291
PROG:frac1
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: frac1
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 624 KB]
   Test 2: TEST OK [0.000 secs, 624 KB]
   Test 3: TEST OK [0.000 secs, 624 KB]
   Test 4: TEST OK [0.000 secs, 624 KB]
   Test 5: TEST OK [0.000 secs, 624 KB]
   Test 6: TEST OK [0.000 secs, 624 KB]
   Test 7: TEST OK [0.000 secs, 624 KB]
   Test 8: TEST OK [0.000 secs, 624 KB]
   Test 9: TEST OK [0.000 secs, 624 KB]
   Test 10: TEST OK [0.000 secs, 624 KB]
   Test 11: TEST OK [0.000 secs, 624 KB]

All tests OK.
Your program ('frac1') produced all correct answers!  This is your
submission #2 for this problem.  Congratulations!
}
var
	data:array[0..30000]of extended;
	a,b:array[0..30000]of byte;
	i,j,n,m,l,r:longint;
function gcd(a,b:longint):longint;
var
	t:longint;
begin
        if a=0 then exit(b);
        if b=0 then exit(a);
        exit(gcd(b,a mod b));
end;
procedure qsort(s,t:longint);
var
	k:extended;
	i,j,u:longint;
	y:extended;
begin
	i:=s;j:=t;k:=data[(s+t)shr 1];
	repeat
		while data[j]>k do dec(j);
		while data[i]<k do inc(i);
		if (i<=j) then begin
			u:=a[i];a[i]:=a[j];a[j]:=u;
			u:=b[i];b[i]:=b[j];b[j]:=u;
			y:=data[i];data[i]:=data[j];data[j]:=y;
			inc(i);dec(j);
			end;
	until i>=j;
	if (i<t) then qsort(i,t);
	if (s<j) then qsort(s,j);
end;
begin
	assign(input,'frac1.in');reset(input);assign(output,'frac1.out');rewrite(output);
	readln(n);
	l:=0;r:=0;
	for i:=1 to n do//·ÖÄ¸
		for j:=0 to i do//·Ö×Ó
			if gcd(i,j)=1 then
				begin
					inc(r);
					a[r]:=j;
					b[r]:=i;
					data[r]:=j/i;
				end;
	qsort(1,r);
	for i:=1 to r do
		writeln(a[i],'/',b[i]);
	close(output);close(input);
end.
