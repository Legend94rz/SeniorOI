const
	m=1000000000;
var
	i,j,n:longint;
	f:array[-2000000..2000000]of longint;
begin
	assign(input,'input.txt');reset(input);assign(output,'output.txt');rewrite(output);
	readln(n);
	f[0]:=1;
	for i:=1 to 21 do
		for j:=1 shl (i-1) to n do
			f[j]:=(f[j] mod m+f[j-1 shl(i-1)]mod m)mod m;
	writeln(f[n]);
	close(output);
end.

