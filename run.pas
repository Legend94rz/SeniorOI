var
	i,s:longint;
	M,T,U,F,D:longint;
	p:array['a'..'z']of longint;
	c:char;
begin
	assign(input,'run.in');reset(input);assign(output,'run.out');rewrite(output);
	readln(M,T,U,F,D);
	p['u']:=u;
	p['f']:=f;p['d']:=d;
	for i:=1 to t do
		begin
			readln(c);
			if c ='u' then
				inc(s,p['d']);
			inc(s,p[c]);
			if c='d' then
				inc(s,p['u']);
                        if c='f' then inc(s,p[c]);
			if s>m then begin writeln(i-1);close(output);halt;end;
		end;
        writeln(t);
	close(output);
end.
