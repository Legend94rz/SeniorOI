var
	i,j,min,max:longint;
	s:string;
	a:array['a'..'z']of longint;
	c:char;
function judge(k:longint):boolean;
var
	i:longint;
begin
	if k<2 then exit(false);
	if k=2 then exit(true);
	for i:=2 to trunc(sqrt(k)) do
		if k mod i= 0 then
			exit(false);
	exit(true);
end;
begin
	readln(s);
	for i:=1 to length(s) do
		inc(a[s[i]]);
	min:=100000;
	for c:='a' to 'z' do
		if (a[c]<>0) then
			begin
			if a[c]<min then
				min:=a[c];
			if a[c]>max then
				max:=a[c];
			end;
	if judge(max-min) then
		begin
		writeln('Lucky Word');
		writeln(max-min);
		end
	else
		begin
		writeln('No Answer');
		writelN(0);
		end;
end.
