var
	s:string;
	i,j,p,sum,m:longint;
        a:array[1..20]of longint;
begin
	readlN(s);
	j:=1;
	for i:=length(s) downto 1 do
        begin
			if(s[i]='?')then begin p:=j;inc(j);continue;end;
			if(s[i]in['0'..'9'])then
				begin
					a[j]:= ord(s[i])-ord('0') ;
					sum:=sum+a[j]*j;
				end
		else
			if(s[i]='X')then
				sum:=sum+10 ;
                inc(j);
        end;
	//writeln(p);
	for m:=1 to 10 do
		begin
		if(sum mod 11=0)then begin writeln(0);halt;end;
			if(sum+m*p)mod 11=0 then
				begin
					if (m=10)and(p=1) then
						begin
                                                        writeln('X');
                                                        halt;
                                                end
						else
                                                if (m=10)and(p<>1)then
                                                begin
                                                        writeln(-1);halt;
                                                end;
					writeln(m);
					halt;
				end;
		end
	//writeln(-1);
end.
