const
	tb:array['A'..'F'] of longint=(10,11,12,13,14,15);
type
	arr=array[0..10000]of longint;
var
	s:string;
	a,b:arr;
	n,m,k,step,i:longint;
function check(t:arr):boolean;
var
	i:longint;
begin
	for i:=1 to n div 2 do
		if a[i]<>a[n-i+1] then
			exit(false);
	exit(true);
end;
begin
	readln(k);
	readln(s);
	for i:=1 to length(s) do
		begin
		if s[i]in ['0'..'9']then
			begin
				a[length(s)-i+1]:=ord(s[i])-ord('0');
				b[i]:=a[length(s)-i+1];
			end
		else
			if s[i]in['A'..'Z']then
				begin
					a[length(s)-i+1]:=tb[s[i]];
					b[i]:=a[length(s)-i+1];				
				end;
		end;
        {for i:=1 to length(s) do
                write(a[i],' ');}
	n:=length(s);
	step:=0;
	if check(a) then
		begin
			writeln(0);
			halt;
		end;
	while step<30 do
		begin
			inc(step);
			for I:=1 to n do
				begin
					a[i]:=a[i]+b[i];
				end;
			for i:=1 to n do
				begin
					a[i+1]:=a[i+1]+a[i] div k;
					a[i]:=a[i] mod k;
				end;
			if a[n+1]<>0 then inc(n);
			{for i:=1 to n do
				write(a[i]);
			write(' ');}
			for i:=1 to n do
				b[n-i+1]:=a[i];
			{for i:=1 to n do
				write(b[i]);
			writeln; }
			if check(a) then begin
				writeln('STEP=',step);
				halt;
				end;
		end;
	writeln('Impossible!');
end.
