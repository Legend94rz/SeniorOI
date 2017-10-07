var
	i,j,a,b,tmax,tmin:longint;
	V:ARRAY[1..101]of boolean;
begin
	assign(input,'ball.in');reset(input);assign(output,'ball.out');rewrite(output);
	while not eof do
		begin
			readln(a,b);
            tmax:=a;if tmax<b then tmax:=b;
            tmin:=a;if tmin>b then tmin:=b;
			fillchar(v,sizeof(v),0);i:=2;
			while (a>100)and(i<=100) do
				begin
					if a mod i =0 then
                    	begin
							a:=a div i;v[i]:=true;
                    	end;
					inc(i);
				end;
			i:=2;
			while (b>100) and(i<=100) do
				begin
					if (b mod i=0)and(not v[i]) then begin b:=b div i;v[i]:=true;end;
					inc(i);
				end;
			if (a<=100)and(b<=100)and(a<>b) then writeln(tmax) else writeln(tmin);
        end;
	close(output);
end.

