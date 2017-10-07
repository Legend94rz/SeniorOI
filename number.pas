var
	i,j,B,t:longint;
	n:int64;
	test:longint;
	f:boolean;
function check(r:longint;n:int64):boolean;
var
	i,l:longint;
	a:array[0..100]of int64;
	rest:int64;
begin
	l:=0;
	while n>0 do
		begin
			rest:=n mod r;
			inc(l);
			a[l]:=rest;
			n:=n div r;
        end;
	for i:=1 to l shr 1 do
		if a[i]<>a[l-i+1] then
			exit(false);
	exit(true);
end;
begin
	assign(input,'number.in');reset(input);assign(output,'number.out');rewrite(output);
	readln(test);
	for t:=1 to test do
		begin
			readln(n);f:=false;
			for b:=2 to trunc(sqrt(n)) do
				if check(b,n) then
					begin
						writeln(b);
						f:=true;
						break;
					end;
			if f then continue;
			for i:=trunc(sqrt(n)) downto 1 do
				if (n mod i=0)and(n div i-1>=2)and(n div i-1<=n) then
					begin
						writeln(n div i-1);
						f:=true;break;
					end;
			if f then continue;
			writeln(n+1);
		end;
	close(output);
end.

