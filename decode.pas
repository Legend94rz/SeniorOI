var
	j,n,m:longint;
	i:char;
	ch:array['A'..'Z']of char;
	s:ansistring;
begin
	assign(input,'decode.in');reset(input);assign(output,'decode.out');rewrite(output);
	readln(s);i:='A';
	while not eoln do begin read(ch[i]);inc(i);end;
	for j:=1 to length(s) do
		if s[j] in['A'..'Z'] then
			write(ch[s[j]])
		else
			write(s[j]);
	writeln;
	close(output);
end.

