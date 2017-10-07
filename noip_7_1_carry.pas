vAR
	I,J:Longint;
	a:array[0..10005]of longint;
	ans:longint;
	t,n:longint;
	flag:boolean;
begin
	assign(input,'carry.in');reset(input);assign(output,'carry.out');rewrite(output);
	readln(N);
	for i:=1 to n do
		read(a[i]);
	repeat
		flag:=true;
		for i:=2 to n do
			if a[i]<a[i-1] then
				begin
					t:=a[i];a[i]:=a[i-1];a[i-1]:=t;
					inc(ans);
					flag:=false;				
				end;
	until flag;
	writeln(ans);
	close(input);close(output);
end.
