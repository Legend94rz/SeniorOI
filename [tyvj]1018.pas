var
	i,n,k:longint;
	s:extended;
	ans:string;
begin
	readln(n,k);
	s:=1;
	for i:=1 to n do
		s:=s*i;
	while trunc(s) mod 10=0 do s:=s/10;
	//writeln(s:0:0);
	for i:=1 to k do
		if s>0.1 then
			begin
				ans:=chr(trunc(s)mod 10+48)+ans;
				s:=s/10;
				if s/10<=0.1 then break;
			end;
	writeln(ans);
end.

