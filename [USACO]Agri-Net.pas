{
id:rz109291
PROG:agrinet
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: agrinet
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 744 KB]
   Test 2: TEST OK [0.000 secs, 744 KB]
   Test 3: TEST OK [0.000 secs, 744 KB]
   Test 4: TEST OK [0.000 secs, 744 KB]
   Test 5: TEST OK [0.000 secs, 744 KB]
   Test 6: TEST OK [0.000 secs, 744 KB]
   Test 7: TEST OK [0.000 secs, 744 KB]
   Test 8: TEST OK [0.000 secs, 744 KB]
   Test 9: TEST OK [0.027 secs, 744 KB]
   Test 10: TEST OK [0.027 secs, 744 KB]

All tests OK.
Your program ('agrinet') produced all correct answers!  This is your
submission #2 for this problem.  Congratulations!
}
var
	a,b,father,e:array[0..30000]of longint;
	i,j,n,m,x,y,t:longint;
	mst:int64;
procedure qsort(s,t:longint);
var
	i,j,k,y:longint;
begin
	i:=s;j:=t;k:=e[(s+t)shr 1];
	repeat
		while e[j]>k do dec(j);
		while e[i]<k do inc(i);
		if i<=j then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				y:=b[i];b[i]:=b[j];b[j]:=y;
				y:=e[i];e[i]:=e[j];e[j]:=y;
				inc(i);dec(j);
			end;
	until i>=j;
	if (i<t) then qsort(i,t);
	if (s<j) then qsort(s,j);
end;
function getfather(x:longint):longint;
begin
	while father[x]<>x do x:=father[x];
	exit(x);
end;
begin
	assign(input,'agrinet.in');reset(input);assign(output,'agrinet.out');rewrite(output);
	readLN(n);
	for i:=1 to n do
		for j:=1 to n do
			begin
			read(t);
			if t<>0 then
				begin
					inc(m);
					a[m]:=i;
					b[m]:=j;
					e[m]:=t;
				end;
			end;
        qsort(1,m);
	{for i:=1 to m do
		writelN(e[i]);}
	for I:=1 to m do
		father[i]:=i;
	for i:=1 to m do
		begin
			x:=getfather(a[i]);
			y:=getfather(b[i]);
			if x<>y then
				begin
					inc(mst,e[i]);
					father[x]:=y;
				end;
		end;
	writeln(mst);
	close(input);close(output);
end.
