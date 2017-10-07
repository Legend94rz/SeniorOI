var
	i,j,n:Longint;
	a,b,c:longint;
	s:string;
	h,st,ed:char;
function get(ch:char):char;
begin
	if a=3 then exit('*');
	if (a=2) then exit(upcase(ch));
	exit(ch);
end;
begin
	readln(a,b,c);
	readln(s);
	for i:=1 to length(s) do
			if (i>1)and(s[i+1]>s[i-1])and(s[i]='-')and((s[i-1]in ['a'..'z'])and(s[i+1] in ['a'..'z'])or(s[i-1] in['0'..'9'])and(s[i+1] in ['0'..'9'])) then
				begin
					st:=chr(ord(s[i-1])+1);
					ed:=chr(ord(s[i+1])-1);
					if c=1 then
						for h:=st to ed do
							for j:=1 to b do
									write(get(h))
					else
						for h:=ed downto st do
							for j:=1 to b do
								write(get(h));
				end
			else
				write(s[i]);
	writeln;
end.


