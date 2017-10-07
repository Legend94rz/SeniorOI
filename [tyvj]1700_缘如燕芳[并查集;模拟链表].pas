var
	f:array[0..1000000]of longint;
	a,b,o1,o2:array[0..1000000]of longint;
	i,j,n,m:longint;
	x,y,t:longint;
	next,last,time:array[0..100001]of longint;
function getf(x:longint):longint;
var
	c,u:longint;
begin
	c:=x;
	while f[x]<>x do x:=f[x];
	while c<>x do
		begin
			u:=f[c];
			f[c]:=x;
			c:=u;
        end;
end;
begin
	readln(n);
	readln(m);
	for i:=1 to n do begin last[i]:=i;f[i]:=i;end;
	for i:=1 to m do readln;
	for i:=1 to m do readln(o1[i],o2[i]);
	for i:=m downto 1 do
		begin
			x:=getf(o1[i]);y:=getf(o2[i]);
			if x>y then begin t:=y;y:=x;x:=t;end;
			if x<>y then
                begin
					f[y]:=x;
					if x=1 then
						begin
							t:=y;
							while t<>0 do
								begin
									time[t]:=i;
									t:=next[t];
								end;
						end;
					next[last[x]]:=y;
					last[x]:=last[y];
				end;
        end;
	for i:=2 to n do
		writeln(time[i]);
end.

