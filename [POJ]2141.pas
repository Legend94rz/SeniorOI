var
	s,t:string;
	i,j:longint;
	c,d:char;
	a:array['a'..'z']of char;
        b:array['A'..'Z'] of char;
begin
	readlN(s);
	c:='a';d:='A';
	for i:=1 to length(s) do
		begin
			if(s[i]in['a'..'z'])then
				a[ c ]:=s[i]
			else
				b[ d ]:=chr(ord(s[i])-32);
			c:=chr(ord(c)+1);
			d:=chr(ord(d)+1);
		end;
	readln(t);
	for i:=1 to length(t)-1 do
		if(t[i]<>' ')then
			if(t[i]in['a'..'z'])then
				write(a[ t[i] ])
			else
				write(   chr(ord(a[ chr(ord(t[i])+32) ])-32   )  )
		else
			write(' ');
	if(t[length(t)]in['a'..'z'])then
		writeln(a[t[length(t)]])
	else
		writeln(b[t[length(t)]])
end.
