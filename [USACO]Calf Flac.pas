{
ID:rz109291
PROG:calfflac
LANG:PASCAL
}
var
	i,j,l,r,x,y,maxx,maxy,max:longint;
	c:char;
	ch:array[0..22001]of char;//原串
	change:array[0..20001]of longint;//映射关系
	opt:array[0..20001]of char;//转换后串
begin
	assign(input,'calfflac.in');reset(input);
	assign(output,'calfflac.out');rewrite(output);
	for i:=1 to 22000 do
		if not eof then
			begin
			read(ch[i]);
			c:=upcase(ch[i]);
			if (c>='A')and(c<='Z')then
				begin
					inc(l);
					change[l]:=i;
					opt[l]:=c;
				end;
			end
		else
			begin
				r:=i;
				break;
			end;
	for i:=1 to l do
		begin
		x:=i-1;y:=i+1;
		while (x>=1)and(y<=l)and(opt[x]=opt[y])do
			begin
			dec(x);inc(y);
			end;
                if y-x+1>max then
		        begin
                                max:=y-x+1;
                                maxx:=x+1;maxy:=y-1;

                        end;
                x:=i;y:=i+1;
		while (x>=1)and(y<=l)and(opt[x]=opt[y])do
			begin
			dec(x);inc(y);
			end;
		if y-x+1>max then begin
                                max:=y-x+1;
				maxx:=x+1;maxy:=y-1;
			end;
                end;
        writeln(max-2);
	for i:=change[maxx] to change[maxy] do
		write(ch[i]);
        writeln;
	close(input);
	close(output);
end.
