var
	a:array[0..25000005]of longint;
	n,i,j,k:longint;
	ans:longint;
begin
	readln(n);
	a[1]:=1;a[2]:=2;k:=2;
	for i:=2 to n do
		begin
			for j:=k to k+a[i]-1 do
				begin
					a[j]:=i;
					inc(k);
				end;
			ans:=ans+a[i];
		end;
	writeln(ans+1);
end.
