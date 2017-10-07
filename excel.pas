const
	d:array[0..25]of char=('Z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y');
var
	i,x,y,n,m:longint;
	t,ko,r,c:char;
	tt,tt2:string;
function cal(key:longint):string;
var
	i,j,k,t,r:longint;
	s:string;
begin
	if key>n then exit('-1');
	t:=key;s:='';
	While t>0 do
		begin
			r:=t mod 26;
			t:=t div 26;
			if (r=0) then
				dec(t);
			s:=d[r]+s;
		end;
	exit(s);
end;
begin
	assign(input,'excel.in');reset(input);assign(output,'excel.out');rewrite(output);
	readlN(n,m);
	for i:=1 to m do
		begin
			read(r);read(ko);
			read(x);
			read(ko);read(c);read(ko);
			readLn(y);
			tt:=cal(x);
			tt2:=cal(y);
			if (tt='-1')or(tt2='-1')or(c=r)or(x=0)or(y=0) then
				begin
					writeln(-1);
					continue;
				end;
			if (r='R')and(c='C') then writeln(x,' ',tt2);
			if (c='R')and(r='C') then writeln(y,' ',tt);
		end;
	close(input);close(output);
end.
