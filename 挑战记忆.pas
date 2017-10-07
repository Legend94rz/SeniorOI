var
	s:string;
	a:array[1..200]of integer;
	i,j,sum,b,code,t:integer;
begin
	repeat
		sum:=0;t:=0;i:=1;b:=1;
		readln(s);
		for j:=1 to length(s) do
			if s[j]=' ' then
				begin
				val(copy(s,i,j-i),a[b],code);
				i:=j+1;
				b:=b+1;
				end;
		val(copy(s,i,j-i+1),a[b],code);
		readln(s);
		i:=1;
		for j:=1 to length(s) do
			if s[j]=' ' then
				begin
				val(copy(s,i,j-i),t,code);
				i:=j+1;
				sum:=sum+a[t];
				end;
		val(copy(s,i,j-i+1),t,code);
		sum:=sum+a[t];
		writeln(sum);
		writeln('-----------------------');
	until false;
end.
