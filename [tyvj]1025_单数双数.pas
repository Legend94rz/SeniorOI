var
	s:string;
	n,i:longint;
begin
	readln(n);
	for i:=1 to n do
		begin
			readln(s);
			if (ord(s[length(s)])-48) and 1=0 then
				writeln('even')
			else
				writeln('odd');
        end;
end.
