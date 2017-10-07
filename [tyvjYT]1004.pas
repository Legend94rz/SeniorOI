var
	shang,xia,zong:array[0..30,1..2]of longint;
	m,x,a,n,i,j,f:longint;
begin
	readln(a,n,m,x);
	shang[1,1]:=1;
	shang[2,2]:=1;
	xia[2,2]:=1;
	zong[1,1]:=1;
	zong[2,1]:=1;
	for i:=3 to n do
		for j:=1 to 2 do
			begin
			shang[i,j]:=shang[i-1,j]+shang[i-2,j];
			xia[i,j]:=shang[i-1,j];
			zong[i,j]:=zong[i-1,j]+shang[i,j]-xia[i,j];
			end;
	if (m-zong[n-1,1]*a) mod zong[n-1,2]<>0 then
		begin
		writeln('No answer.');
		halt;
		end;
	f:=(m-zong[n-1,1]*a) div zong[n-1,2];
	writeln(zong[x,1]*a+zong[x,2]*f);			
end.
{
站数　　  1　　  2　　   3　　   4　　  5　　  6　　  ……　　N
上车人数  A　　  F　　  A+F　　 A+2F  2A+3F   3A+5F    ……　　0
下车人数  0　　  F　　   F　　  A+F　　A+2F   2A+3F    ……　　M
总人数　　A　　  A　　  2A　　 2A+F  3A+2F    4A+4F    ……　　0
}
