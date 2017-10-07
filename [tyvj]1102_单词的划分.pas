var
	i,j,n,m,t:longint;
	f:array[0..1000]of longint;
	s:string;
	a:array[0..200]of string;
function check(s:string):boolean;
var
	i:longint;
begin
	for i:=1 to n do
		if a[i]=s then
			exit(true);
	exit(false);
end;
begin
	readln(s);
	readln(n);
	for i:=1 to n do
		readln(a[i]);
	fillchar(f,sizeof(f),$3f);f[0]:=0;
	for i:=1 to length(s) do
		begin
			t:=$3f3f3f3f;
			for j:=0 to i do
				if check(copy(s,j+1,i-j)) then
					if f[j]<t then
						t:=f[j];
			f[i]:=t+1;
		end;
	writeln(f[length(s)]);
end.

