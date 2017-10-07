var
	i,j,n,m,k,p:longint;
	s,t:longint;
	g:array[0..101,0..10001]of boolean;
	a:array[0..101]of longint;
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
begin
	readln(n,p,m);
	for i:=1 to n do begin readln(a[i]);a[i]:=a[i] mod m;end;
	g[1,0]:=true;
	for i:=1 to n do
		begin
			t:=max(1,i-p);
			for j:=t to i-1 do
				for k:=0 to m-1 do
					if g[j,k] then
						g[i,(k+((i-j)*a[i])mod m)mod m]:=true;
        end;
	for i:=m-1 downto 0 do
		if g[n,i] then
			begin
				writeln(i);exit;
            end;
end.

