var
	i,j,n,top,l,num:longint;
	st:array[0..11]of longint;
	q:array[0..101]of longint;
	ch:char;
begin
	readln(n);
	for i:=1 to n do
		begin
			read(ch);
			if ch='A' then begin inc(num);inc(l);q[l]:=num;end;
			if ch='B' then
				if top<5 then
					begin
						inc(num);inc(top); st[top]:=num;
                    end
				else
					begin
						writeln('No');halt;
					end;
			if ch='C' then
				if top>0 then
					begin
						inc(l);q[l]:=st[top];dec(top);
					end
				else
					begin
						writeln('No');halt;
                    end;
        end;
	writeln('Yes');
	for i:=1 to l do writeln(q[i]);
end.

