var
	i,j,n:longint;
	s:ansistring;
	v:boolean;
procedure work;
var
	l,r:longint;
	c,x:longint;
	u:string;
	t,s2:ansistring;
begin
	for i:=1 to length(s) do
		if s[i]=']'then
			begin
				r:=i;break;
			end;
	for i:=r downto 1 do
		if s[i]='[' then
			begin
				L:=i;break;
                        end;
        u:='';
	for i:=l to r do
		if s[i]in['0'..'9'] then
			begin
			u:=u+s[i];
			x:=i;
			end;
	val(u,c);
	t:=copy(s,x+1,r-x-1);
	s2:=t;
	for i:=1 to c-1 do
		s2:=s2+t;
	delete(s,l,r-l+1);
	insert(s2,s,l);
	v:=false;
	for i:=1 to length(s) do
		if s[i]='[' then
			begin
				v:=true;
				break;
			end;
	if v then work;
end;
begin
	ASSIGN(input,'password.in');reset(input);assign(output,'password.out');rewrite(output);
	readln(s);
	for i:=1 to LENGTH(S) do
		if s[i]='[' then
			begin
			v:=true;
			break;
			end;
	if v then work;
	writeln(s);
	close(output);
end.
