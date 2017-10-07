var
	k,i,a,ans,n:Longint;
	f:array[-1000005..1000005]of longint;
begin
	readln(n,k);
	for i:=1 to n do
		begin
                        read(a);
			f[a]:=f[a-k]+1;
			if f[a]>ans then ans:=f[a];
		end;
	writeln(ans);
end.

