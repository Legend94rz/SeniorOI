var
	i,j,n:longint;
	s:array[0..2000]of string;
	f:boolean;
	t:string;
function s2I(k:string):longint;
begin
	val(k,s2i);
end;
function small(s1,s2:string):boolean;
begin
	if s1+s2<s2+s1 then
		exit(true);
	exit(false);
end;
begin
	assign(input,'brick.in');reset(input);assign(output,'brick.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		readln(s[i]);
	repeat
		f:=false;
		for i:=1 to n-1 do
			if small(s[i],s[i+1]) then//s[i]比s[i+1]小
				begin
					t:=s[i];
					s[i]:=s[i+1];
					s[I+1]:=t;
					f:=true;
				end;
	until not f;
	for i:=1 to n do
		write(s[i]);
	writeln;
	close(output);
end.
