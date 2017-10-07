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
   Test 2: TEST OK [0.000 secs, 276 KB]
   Test 3: TEST OK [0.000 secs, 276 KB]
   Test 4: TEST OK [0.000 secs, 276 KB]
   Test 5: TEST OK [0.000 secs, 276 KB]
   Test 6: TEST OK [0.000 secs, 276 KB]

All tests OK.
Your program ('ratios') produced all correct answers!  This is your
submission #6 for this problem.  Congratulations!
}
var
   a,b,c:double;
   x,y,z,kk,i,n,j:longint;
   matrix,ww:array[0..4,0..4]of double;
   temp:array[0..4]of double;
   f,s,t:array[0..4]of double;
procedure gauss;
var
   i,j,k:longint;
   m:double;
   x:array[0..4]of double;
   a:array[0..4]of int64;
begin
	for i:=1 to 2 do
		begin
			for j:=i to 3 do
				if matrix[j,i]>matrix[i,i] then
					begin
						temp:=matrix[j];
						matrix[j]:=matrix[i];
						matrix[i]:=temp;
					end;
			for j:=i+1 to 3 do
					begin
						if matrix[j,i]<>0 then
							m:=matrix[j,i]/matrix[i,i]
						else continue;
					matrix[j,i]:=0;
					for k:=i+1 to 4 do
						matrix[j,k]:=matrix[i,k]*m-matrix[j,k];
				end;
		end;
	x[3]:=matrix[3,4]/matrix[3,3];
	for i:=2 downto 1 do
		begin
			m:=0;
			for j:=i+1 to 3 do
				m:=m+x[j]*matrix[i,j];
			x[i]:=(matrix[i,4]-m)/matrix[i,i];
			if trunc(x[i])<0 then exit;
		end;
	for i:=1 to 3 do
		a[i]:= trunc(x[i])+round(frac(x[i]));
	if not( abs(trunc(a[1]*f[1]+a[2]*f[2]+a[3]*f[3])-trunc(ww[1,4]))<0.01) then exit;
	if not (abs(trunc(a[1]*s[1]+a[2]*s[2]+a[3]*s[3])-trunc(ww[2,4]))<0.01) then exit;
	if not( abs(trunc(a[1]*t[1]+a[2]*t[2]+a[3]*t[3])-trunc(ww[3,4]))<0.01) then exit;
	for i:=1 to 3 do
		write(a[i],' ');
	writelN(kk);
	close(output);
	halt;
end;
begin
    assign(input,'ratios.in');reset(input);assign(output,'ratios.out');rewrite(output);
	readln(x,y,z);
	for i:=1 to 3 do
		readln(f[i],s[i],t[i]);
	for i:=1 to 3 do ww[1,i]:=f[i];
	for i:=1 to 3 do ww[2,i]:=s[i];
	for i:=1 to 3 do ww[3,i]:=t[i];
	for kk:=1 to 10000 do
		begin
			ww[1,4]:=kk*x;ww[2,4]:=kk*y;ww[3,4]:=kk*z;
			matrix:=ww;
			gauss;
		end;
        writelN('NONE');
    close(input);close(output);
end.
