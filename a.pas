var
	x,y:longint;
	a:array[0..1000]of longint;
	qu:array[0..1000]of longint;
	i,j:longint;
	yu:longint;
	lp:boolean;
	plps,plpt:longint;
begin
        //assign(input,'a.in');reset(input);assign(output,'a.out');rewrite(output);
        readln(x,y);
        for i:=0 to 1000 do
                a[i]:=-1;
        a[0]:=x div y;
	lp:=false;
	for i:=1 to 100 do
	begin
		yu:=x-a[i-1]*y;
		qu[i]:=yu;
		for j:=1 to i-1 do
			if (qu[j]=qu[i])and(qu[j]<>0) then
				begin
					lp:=true;
					plps:=j;
					plpt:=i-1;
					//writeln(plps,' ',plpt);
					break;
				end;
		x:=10*yu;
                if lp then break;
		if not lp then
			a[i]:=x div y;
	end;
        write(a[0]);
	if (a[1]<>-1){and(a[1]<>0)} then write('.');
	for i:=1 to 100 do
	if (a[i]<>-1){and(a[i]<>0)} then
		if lp then
			begin
			if (i=plps)and(plps>0) then
				write('(',a[i])
			else
				if (i=plpt)and(plpt>plps)then
					write(a[i],')')
				else
					write(a[i]);
			end
		else
			write(a[i]);
        if (plps=plpt)and(lp)then
                writeln(')')
        else
                writeln;
        //close(input);close(output);
end.
