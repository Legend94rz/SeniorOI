{
id:rz109291
PROG:shopping
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: shopping
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 1296 KB]
   Test 2: TEST OK [0.000 secs, 1296 KB]
   Test 3: TEST OK [0.000 secs, 1296 KB]
   Test 4: TEST OK [0.000 secs, 1296 KB]
   Test 5: TEST OK [0.000 secs, 1296 KB]
   Test 6: TEST OK [0.000 secs, 1296 KB]
   Test 7: TEST OK [0.000 secs, 1296 KB]
   Test 8: TEST OK [0.000 secs, 1296 KB]
   Test 9: TEST OK [0.000 secs, 1296 KB]
   Test 10: TEST OK [0.000 secs, 1296 KB]
   Test 11: TEST OK [0.000 secs, 1296 KB]
   Test 12: TEST OK [0.000 secs, 1296 KB]

All tests OK.
Your program ('shopping') produced all correct answers!  This is your
submission #3 for this problem.  Congratulations!
}
var
	hao:array[0..1000]of longint;
	f:array[0..5,0..5,0..5,0..5,0..5]of longint;
	z:array[0..500,0..500]of longint;
	y,mm,val:array[0..500]of longint;
	i,j:longint;
	m,b,k,n:longint;
	i1,i2,i3,i4,i5:longint;
	c,p:longint;
	kk:array[0..1000]of boolean;
function w(key:longint):longint;
var
	i:longint;
begin
	for i:=1 to b do
		if hao[i]=key then
			exit(i);
	exit(0);
end;
begin
	assign(input,'shopping.in');reset(input);//assign(output,'shopping.out');rewrite(output);
	readlN(m);
	for i:=1 to m do
		readln;
	readln(b);
	for i:=1 to b do
		readln(hao[i],mm[i],y[i]);
	reset(input);
	readln(m);
	for i:=1 to m do
		begin
			read(n);
			for j:=1 to n do
				begin
					read(c,k);
					c:=w(c);
					if c=0 then kk[i]:=true;
					if not kk[i] then z[i,c]:=k;
				end;
			readln(val[i]);
		end;
        for i1:=0 to mm[1] do
		for i2:=0 to mm[2] do
			for i3:=0 to mm[3] do
				for i4 :=0 to mm[4] do
					for i5:=0 to mm[5] do
						f[i1,i2,i3,i4,i5]:=i1*y[1]+i2*y[2]+i3*y[3]+i4*y[4]+i5*y[5];
	for i:=1 to m do
		if not kk[i] then
		for i1:=z[i,1] to mm[1] do
			for i2:=z[i,2] to mm[2] do
				for i3:=z[i,3] to mm[3] do
					for i4:=z[i,4] to mm[4] do
						for i5 :=z[i,5] to mm[5] do
							if f[i1,i2,i3,i4,i5]>f[i1-z[i,1],i2-z[i,2],i3-z[i,3],i4-z[i,4],i5-z[i,5]]+val[i] then
								f[i1,i2,i3,i4,i5]:=f[i1-z[i,1],i2-z[i,2],i3-z[i,3],i4-z[i,4],i5-z[i,5]]+val[i];
	writeln(f[mm[1],mm[2],mm[3],mm[4],mm[5]]);
	close(output);close(input);
end.
