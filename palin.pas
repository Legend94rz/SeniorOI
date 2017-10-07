const
	p=1000000007;
var
	i,j,n,tn,ans,s:Longint;
	f:array[0..100001]of longint;
begin
	assign(input,'palin.in');reset(input);assign(output,'palin.out');rewrite(output);
	readln(n);
	s:=1;f[0]:=1;f[1]:=1;
	for i:=1 to n shr 1 do
		begin
			s:=(s+f[i])mod p;
			f[i shl 1]:=s;f[i shl 1+1]:=s;
		end;
	writeln(f[n]);
	close(output);
end.

