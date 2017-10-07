var
	s:string;
	i,j,h,le,l:longint;
	ch:array[-100..100,1..100]of char;
	la:array[-100..100]of longint;
function empty(i:longint):boolean;
var
	j:longint;
begin
	for j:=1 to 100 do
		if(ch[i,j]<>'*')and(ch[i,j]<>'|')then
			exit(false);
	exit(true);
end;
begin
	readln(s);
	le:=length(s);
	l:=1;h:=3;
	fillchar(ch,sizeof(ch),'*');
	if s[1]='R'then
		ch[1,3]:='/'
	else
		if(s[1]='C')then
			ch[1,3]:='_'
		else
			ch[1,3]:='\';
	la[1]:=3;
	for i:=-100 to 100 do ch[i,1]:='|';
	for i:=2 to le do
		begin
			case s[i] of
				'R':if (s[i-1]='R') then dec(l);
				'C':if (s[i-1]='R') then dec(l);
				'F':if (s[i-1]<>'R')then inc(l);
			end;
			inc(h);
			if s[i]='R'then
				ch[l,h]:='/'
			else
				if(s[i]='C')then
					ch[l,h]:='_'
				else
					ch[l,h]:='\';
			la[l]:=h;
		end;
	for i:=-100 to 100 do
		if not empty(i)then
		begin
			for j:=1 to la[i]-1 do
				if ch[i,j]<>'*'then
					write(ch[i,j])
				else
					write(' ');
			writeln(ch[i,la[i]]);
		end;
	write('+');
	for i:=1 to le+1 do
		write('-');
	writeln('-');
	for i:=-100 to 100 do
		if not empty(i)then
		begin
			write(i,' ');
		end;
end.
