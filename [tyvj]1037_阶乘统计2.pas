var
	i,j,n,k:longint;
	ans,p:int64;
	s:string;
begin
	readln(n,k);ans:=1;p:=10;
	for i:=1 to k do p:=p*10;
	for i:=1 to n do
		begin
		    ans:=(ans*i);//write('ans ',ans,' -> ');
			while (ans mod 10)=0 do ans:=ans div 10;
			ans:=ans mod p;//writeln(ans);
		end;
	str(ans,s);delete(s,1,1);
	while length(s)<k do s:='0'+s;
	writeln(s);
end.

