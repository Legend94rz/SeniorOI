var
	a:array['A'..'Z']of longint;
	b:array[1..288]of char;
	e:array[1..288,'A'..'Z']of char;
	i,j,max:longint;
	c,d:char;
	s:array[1..4]of string;
function last(i:longint):char;
var
	j:char;
begin
	for j:='Z' downto 'A' do
		if(a[j]>=i)then exit(j);
end;
begin
	fillchar(e,sizeof(e),' ');
	for i:=1to 4 do
		readLN(s[i]);
	for i:=1 to 4 do
		for j:=1 to length(s[i])do
			if s[i,j]in['A'..'Z'] then
				inc(a[s[i,j]]);
	max:=a['A'];
	for c:='B' to 'Z' do
		if a[c]>max then  max:=a[c];
	for i:=max downto 1 do
		for c:='A'to 'Z'do
			if a[c]>=i then
				e[i,c]:='*';
	for i:=max downto 1 do
		begin
		for c:='A'to 'Z'do
			if (c<>last(i))then
				write(e[i,c],' ')
			else
				begin
				writeln(e[i,c]);
				break;
				end;
	end;
	for c:='A'to 'Y'do
		write(c,' ');
	writeln('Z');
end.
