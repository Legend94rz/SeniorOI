var
	n,i,j,k,cc:longint;
	e:array[0..205,0..205]of double;
	x,y:array[0..50000]of longint;
function max(a,b:double):double;
begin
	if a>b then exit(a);
	exit(b);
end;
begin
	while true do begin
		readln(n);
		if n=0 then break;
		inc(cc);
		fillchar(e,sizeof(e),0);
		for i:=1 to n do
			begin
				read(x[i],y[i]);
				for j:=1 to i-1 do
					begin
						e[i,j]:=sqrt(sqr(abs(x[i]-x[j]))+sqr(abs(y[i]-y[j])));
						e[j,i]:=e[i,j];
					end;
			end;
		for k:=1 to n do
			for i:=1 to n do
				if i<>k then
					for j:=1 to n do
						if (k<>j)and(i<>j) then
							if e[i,j]>max(e[i,k],e[k,j]) then
								e[i,j]:=max(e[i,k],e[k,j]);
		writeln('Scenario #',cc);
		writeln('Frog Distance = ',e[1,2]:0:3);
		writeln;
	end;
end.
	
