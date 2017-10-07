var
	j,n,i,k:longint;
	s:array[0..100]of string;
	e:array[0..100,0..100]of longint;
	count:array[0..100]of longint;
begin
	assign(input,'solidarity.in');reset(input);assign(output,'solidarity.out');rewrite(output);
	readln(n);fillchar(e,sizeof(e),$3f);
	for i:=1 to n do
		begin
			readln(s[i]);e[i,i]:=0;
			for j:=1 to length(s[i]) do
				if s[i,j]='Y' then
					e[i,j]:=-1;
		end;
	for k:=1 to n do
		for i:=1 to n do
			if k<>i then
				for j:=1 to n do
					if (j<>k)and(i<>j) then
						if e[i,k]+e[k,j]<e[i,j] then
							e[i,j]:=e[i,k]+e[k,j];
	for i:=1 to n do
		for j:=1 to n do
			if i<>j then
				if (s[i,j]='Y')and(e[i,j]=-1) then
					inc(count[i]);
	for i:=1 to n-1 do
		write(count[i],' ');
	writeln(count[n]);
	close(output);
end.

