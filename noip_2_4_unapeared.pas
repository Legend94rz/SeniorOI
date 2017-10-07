var
	i,j,k:longint;
	n,m:longint;
	b:array[0..10]of longint;
	a:array[0..150000]of longint;
	p:array[0..10]of boolean;
begin
	readln(n,m);
	for I:=1 to n do
		readln(a[i]);
	b[10]:=1;
	for i:=1 to n do
			if not p[a[i]] then
				begin
				inc(j);
				p[a[i]]:=true;
				if j=m then
					begin
						j:=0;
						for k:=1 to m do
							p[k]:=false;
						inc(b[10]);
					end;
				end;
	writeln(b[10]);
end.
