program ty1024;
var
	i,j,k,l:longint;
	s,y:string;
	a:array['a'..'z'] of char;
	c:char;
	q:array[0..300]of string;
	r:longint;
	f:array[0..300]of longint;
begin
	readln(y);
	readln(s);c:='a';
	for i:=1 to length(y) do
		begin
		a[y[i]]:=c;
		c:=succ(c);
		End;
	j:=1;s:=s+' ';
	for i:=1 to length(s) do
		if s[i]=' ' then
			begin
				inc(r);
				q[r]:=copy(s,j,i-j);
				j:=i+1;
			End;
	for k:=1 to r do
		begin
			s:=q[k];fillchar(f,sizeof(f),0);
			for i:=length(s) downto 1 do
				begin
					l:=0;
					for j:=i+1 to length(s) do
						if (a[s[i]]<=a[s[j]])and(f[j]>l) then
							l:=f[j];
					f[i]:=l+1;
				end;
			for i:=2 to length(s) do if f[i]>f[1] then f[1]:=f[i];
			if f[1]>=1 then
				write(f[1])
			else
				write(1);
		End;
	writeln;
end.
