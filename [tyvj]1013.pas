program ty1013;
uses
	math;
var
	f:array[0..101,0..101,1..2]of longint;
	k,i,j,n,m,r:longint;
	time,rmb,rp:array[0..101]of longint;
begin
	readln(n);
	for i:=1 to n do
		readln(rmb[i],rp[i],time[i]);
	readln(m,r);
	fillchar(f,sizeof(f),0);
	for i:=1 to n do
		for j:=m downto rmb[i] do
			for k:=r downto rp[i] do
				if (f[j-rmb[i],k-rp[i],1]+1>f[j,k,1])or(f[j-rmb[i],k-rp[i],1]+1=f[j,k,1])and(f[j-rmb[i],k-rp[i],2]+time[i]<f[j,k,2]) then
					begin
						f[j,k,1]:=f[j-rmb[i],k-rp[i],1]+1;
						f[j,k,2]:=f[j-rmb[i],k-rp[i],2]+time[i];
					End;
	writeln(f[m,r,2]);
End.

