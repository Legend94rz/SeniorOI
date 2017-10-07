program ty1020;
var
	a:array[0..5000]of longint;
	p,t,i,j,r,n,max:Longint;
	isp:array[0..40005]of boolean;
	pr:array[1..40000]of longint;
	flag:boolean;
function getloc(key:longint):longint;
var
	i:longint;
begin
	for i:=1 to r do
		if (isp[i])and(pr[i]>=key) then
			exit(i);
end;
begin
	readln(n);
	for i:=1 to n do
		readlN(a[i]);
	fillchar(isp,sizeof(isp),1);//isp[1]:=false;
	for i:=2 to 20000 do
		if (isp[i]) then
			begin
				j:=i;
				while j+i<=20000 do
					begin
						inc(j,i);
						isp[j]:=false;
					end;
			End;
	for i:=1 to 20000 do
		if isp[i] then
			begin
				inc(r);
				pr[r]:=i;
			End;
	for i:=1 to n do
		for j:=1 to getloc(a[i]) do
			if (a[i] mod pr[j]=0)and(pr[j]>max) then
				begin
					max:=pr[j];
					p:=i;
				end;
	//writeln(max);
	writeln(a[p]);
end.
