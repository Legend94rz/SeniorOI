var
	n,t,r,ta,i:longint;
	a:array[0..100000]of 0..1;
begin
	readln(n);ta:=0;
        if (n=1)or(n=0) then begin writeln(n);halt;end;
	while n<>1 do
		if n=0 then
			break
		else
			if n <0 then
				begin
					if n mod (-2)<>0 then begin
						t:=abs(n-2);
						r:=t mod 2;
						n:=n div (-2)+1;
					end
					else
						begin
						r:=n mod (-2);
						n:=n div (-2);
					end;
					inc(ta);
					a[ta]:=r;
				end
			else
				begin
					r:=n mod (-2);
					n:=n div (-2);
					inc(ta);
					a[ta]:=r;
				end;
        if n=1 then write(1);
	for i:=ta downto 1 do
		write(a[i]);
	writeln;
end.