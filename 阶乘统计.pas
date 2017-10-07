var
	sum:qword;
	n,k,l,r,i:longint;
	s:string;
	ch:array[0..20]of char;
begin
	readln(n,k);
	sum:=1;
	for i:=1 to n do
		sum:=sum*i;
	str(sum,s);
		for i:=length(s) downto 1 do
			if s[i]='0' then
				delete(s,i,1)
			else
				break;
	if length(s)>k then  begin	
		l:=20;
		for i:=length(s) downto 1 do
			begin
			dec(l);
			ch[l]:=s[i];
			inc(r);
			if r>=k then break;
			end;
		for i:=l to 19 do
			write(ch[i]);
		writeln;
	end
	else
		writeln(s);
end.
