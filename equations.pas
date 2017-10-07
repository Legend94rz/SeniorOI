var
	i,j,n:longint;
	y,x:array[0..100001]of longint;
	ans:qword;
function check:boolean;
var
	i:longint;
begin
	for i:=2 to n do
		begin
			x[i]:=2*y[i-1]-x[i-1];
			if (x[i]>y[i])or(x[i]<y[i-1])or(x[i]<x[i-1]) then
				exit(false);
		end;
	exit(true);
end;
begin
	assign(input,'equations.in');reset(input);assign(output,'equations.out');rewrite(output);
	readln(n);
	for i:=1 to n-1 do
		read(y[i]);
	y[n]:=maxlongint;
	for i:=1 to y[1] do
		begin
			x[1]:=i;
			if check then
				//begin
					inc(ans);
					{for j:=1 to n do
						write(x[j],' ');
					writeln;
				end;}
		end;
	writeln(ans);
	close(output);
end.

