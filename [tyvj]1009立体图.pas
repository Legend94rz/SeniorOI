uses math;
const
	bl:array[1..6]of string={(('..+---+'),
							  ('./   /|'),
							  ('+---+ |'),
							  ('|   | +'),
							  ('|   |/.'),
							  ('+---+..'))}
							 (('+---+..'),
							 ('|   |/.'),
							 ('|   | +'),
							 ('+---+ |'),
							 ('./   /|'),
							 ('..+---+'));

var
	ch:array[-1000..1001,-1000..1001]of char;
	i,j,k,m,n,x,y:longint;
	h,g:longint;
	a:array[1..50,1..50]of longint;
	dep:array[0..1000,0..1001]of longint;
	s,l:longint;
	sh,xa,zu,yu:longint;
begin
	readln(n,m);
	fillchar(ch,sizeof(ch),'$');
	for i:=1 to n do
		for j:=1 to m do
			read(a[i,j]);
	h:=1;g:=1;sh:=maxlongint;xa:=-maxlongint;zu:=sh;yu:=xa;
	for i:=1 to n do
		for j:=1 to m do
			for k:=1 to a[i,j] do
				begin
					s:=3*(1-k)+1+(i-1)*2;xa:=max(xa,s);
					for x:=1 to 6 do
						begin
							l:=4*(j-1)+1-(i-1)*2;zu:=min(zu,l);
							for y:=1 to 7 do
								begin
									if bl[x,y]<>'.' then
										ch[s,l]:=bl[x,y];
									inc(l);yu:=max(yu,l);
								end;
							dec(s);sh:=min(sh,s);
						end;
				end;
	for i:=sh+1 to xa do
		begin
			for j:=zu to yu-1 do
				if ch[i,j]='$' then
					write('.')
				else
					write(ch[i,j]);
			writeln;
		end;
end.

