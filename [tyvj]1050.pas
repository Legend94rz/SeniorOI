uses
	math;
var
	f		:array[0..1,0..2001]of longint;
	s1,s2,t	:ansistring;
	i,j		:longint;
begin
	readln(t);
	s1:=copy(t,1,pos(' ',t)-1);
	s2:=copy(t,pos(' ',t)+1,length(t)-pos(' ',t));
	for i:=1 to length(s1) do
		for j:=1 to length(s2) do
			if s1[i]=s2[j] then
				f[i and 1,j]:=f[(i-1)and 1,j-1]+1
			else
				f[i and 1,j]:=max(f[i and 1,j-1],f[(i-1)and 1,j]);
	writeln(f[length(s1)and 1,length(s2)]);
end.
