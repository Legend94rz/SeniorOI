program meet;
var
	i,j,n,m:longint;
	ind:array[0..10000]of boolean;
	ans:longint;
	x,y:longint;
begin
	assign(input,'meet.in');reset(input);assign(output,'meet.out');rewrite(output);
	readln(n,m);
	for i:=1 to m do
		begin
		readln(x,y);
		ind[y]:=true;
	End;
	for i:=1 to n do
		if not ind[i] then
			inc(ans);
	writeln(ans);
	close(output);
end.
