{
id:rz109291
PROG:ratios
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: ratios
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 276 KB]
   Test 2: TEST OK [0.027 secs, 276 KB]
   Test 3: TEST OK [0.000 secs, 276 KB]
   Test 4: TEST OK [0.243 secs, 276 KB]
   Test 5: TEST OK [0.135 secs, 276 KB]
   Test 6: TEST OK [0.135 secs, 276 KB]

All tests OK.
Your program ('ratios') produced all correct answers!  This is your
submission #4 for this problem.  Congratulations!
}
var
	a,b,c:array[0..10]of longint;
	i,j,k:longint;
	ta,tb,tc:longint;
procedure check(x,y,z:longint);
var
	k:longint;
	k1,k2,k3:longint;
	r1,r2,r3:longint;
	m1,m2,m3:boolean;
begin
	r1:=x*a[1]+y*a[2]+z*a[3];
	if ta=0 then
		begin
		m1:=r1=0;
		k1:=0;
		end
	else
		begin
			m1:=(r1 mod ta=0)and(r1<>0);
			k1:=r1 div ta;
		end;
	if not m1 then exit;r2:=x*b[1]+y*b[2]+z*b[3];
	if tb=0 then
		begin
		m2:=r2=0;
		k2:=0;
		end
	else
		begin
			m2:=(r2 mod tb=0)and(r2<>0);
			k2:=r2 div tb;
		end;
	if not m2 then exit;r3:=x*c[1]+y*c[2]+z*c[3];
	if tc=0 then
		begin
		m3:=r3=0;
		k3:=0;
		end
	else
		begin
			m3:=(r3 mod tc=0)and(r3<>0);
			k3:=r3 div tc;
		end;
	if not m3 then exit;
	//writeln(x,' ',y,' ',z);
	if (k1=k2)and(k1=0)and(k3=k2) then exit;
	if (k1=k2)and(k2=k3)or(k1=0)and(k2=k3)or(k2=0)and(k1=k3)or(k3=0)and(k2=k1) then
		begin
			if k1<>0 then
				k:=k1
			else
				if k2<>0 then
						k:=k2
					else
						k:=k3;
			writeln(x,' ',y,' ',z,' ',k);
			//writeln(r1,' ',r2,' ',r3);
			close(input);close(output);
			halt;
		end;
end;
begin
	assign(input,'ratios.in');reset(input);assign(output,'ratios.out');rewrite(output);
	readln(ta,tb,tc);
	for i:=1 to 3 do
		readln(a[i],b[i],c[i]);
	for i:=0 to 210 do
		for j:=0 to 210 do
			for k:=0 to 210 do
				check(i,j,k);
	writeln('NONE');
	close(input);close(output);
end.
