var
	f:array[0..10,0..10,0..10,0..10,0..20]of double;
	n,i,j:Longint;
	sum,ans:extended;
	s:array[0..10,0..10,0..10,0..10]of double;
	a:array[0..10,0..10]of double;
	ave:double;
function min(a,b,c:double):double;
begin
	min:=a;
	if b<min then min:=b;
	if c<min then min:=c;
end;
function cal(i1,j1,i2,j2:longint):double;
var
    i,j:longint;
begin
	if (s[i1,j1,i2,j2]>0) then exit(s[i1,j1,i2,j2]);
	cal:=0;
	for i:=i1 to i2 do
		for j:=j1 to j2 do
			cal:=cal+a[i,j];
	s[i1,j1,i2,j2]:=cal*cal;
	exit(s[i1,j1,i2,j2]);
end;
function ge(i1,j1,i2,j2,k:longint):double;
var
	i,j:longint;
	mini:double;
begin
	if (f[i1,j1,i2,j2,k]>0) then exit(f[i1,j1,i2,j2,k]);
	mini:=maxlongint;
	if k=1 then
		begin
		f[i1,j1,i2,j2,1]:=cal(i1,j1,i2,j2);
		exit(f[i1,j1,i2,j2,1]);
		end;
	for i:=i1 to i2-1 do
		mini:=min(ge(i1,j1,i,j2,k-1)+cal(i+1,j1,i2,j2),ge(i+1,j1,i2,j2,k-1)+cal(i1,j1,i,j2),mini);
	for j:=j1 to j2-1 do
		mini:=min(ge(i1,j1,i2,j,k-1)+cal(i1,j+1,i2,j2),ge(i1,j+1,i2,j2,k-1)+cal(i1,j1,i2,j),mini);
	f[i1,j1,i2,j2,k]:=mini;
	exit(mini);
end;
begin
	readln(n);
	fillchar(f,sizeof(f),0); fillchar(s,sizeof(s),0);
	for i:=1 to 8 do
		for j:=1 to 8 do
		begin
			read(a[i,j]);
			sum:=a[i,j]+sum;
		end;
	ave:=sum/n;
	ans:=ge(1,1,8,8,n);
	writeln(sqrt( ans/n-ave*ave  ):0:3);
end.
