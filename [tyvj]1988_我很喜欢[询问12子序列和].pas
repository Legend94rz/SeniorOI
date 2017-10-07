var
	i,j,n,m,x,s,mf,mg:longint;
	ch:char;
	a,f,g:array[0..1000001]of longint;//f-奇数;g-偶数
begin
	readln(n);
	for i:=1 to n do
		begin
			read(ch);
			a[i]:=ord(ch)-48;
			//writeln('>',a[i]);
			s:=s+a[i];
			if a[i]=1 then
				begin
					f[i]:=g[i-1]+1;
					if f[i-1]>0 then g[i]:=f[i-1]+1;
				end
			else
				begin
					if f[i-1]>0 then f[i]:=f[i-1]+2;
					g[i]:=g[i-1]+2;
				end;
        end;
	readln(m);
	for i:=1 to n do
		begin
			if f[i]>mf then mf:=f[i];
			if g[i]>mg then mg:=g[i];
        end;
	if mf=0 then mf:=-1;
	//writeln(mf,' ',mg);
	for i:=1 to m do
		begin
			read(x);
			if (x<0)or(x>s)or(x and 1=1)and(x>mf)or(x and 1=0)and(x>mg) then begin writeln('NO');continue;end;
			writeln('YES');
        end;
end.

