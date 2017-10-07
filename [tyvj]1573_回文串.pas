uses math;
var
	n,m,i:longint;
	s:string;
	sum,t,k:int64;
	a:array[1..20]of int64=(9,9,90,90,900,900,9000,9000,90000,90000,900000,900000,9000000,9000000,90000000,90000000,900000000,900000000,9000000000,9000000000);
begin
	readln(n);
	if n<=8 then
    	begin
			writeln(n+1);
			halt;
        end;
    inc(n);
	for i:=1 to 20 do
		begin
            if sum+a[i]>=n then break;
			inc(sum,a[i]);
		end;
	m:=i;//m位数
	//writeln('wei =',m);
	t:=10**((m div 2)+(m and 1)-1);
	k:=n-sum;//排在位数为m的回文数的第几个
	//writeln('k= ',k,' t=',t);
	str(t+k-1,s);
	for i:=m div 2 downto 1 do s:=s+s[i];
	writeln(s);
end.

