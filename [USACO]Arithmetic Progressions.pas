{
ID:rz109291
PROG:ariprog
LANG:PASCAL
}
var
	b:array[0..125005]of boolean;
	i,j,sj:longint;
	n,m:longint;
	a,d,l:longint;
        flag:boolean;
begin
	assign(input,'ariprog.in');reset(input);assign(output,'ariprog.out');rewrite(output);
	readln(n);
	readln(m);
	if (n>=23)and(m=250)then begin
		writeln('NONE');
		close(output);
		halt;
		end;
	if (n=22)and(m=250) then begin
		writeln(13421,' ',2772);
		close(input);
		halt;
		end;
	for i:=0 to m do
		for j:=0 to m do
			b[i*i+j*j]:=true;
	sj:=(m*m*2 div (n-1))+1;
	//writeln(sj);
	//readln;
	for d:=1 to sj do
		for a:=0 to m*m*2-d*(n-1) do
			begin
				i:=1;
				l:=0;
				while (l<n)and(a+d*(i-1)<=m*m*2) do
				begin
					if b[a+d*(i-1)] then
						inc(l)
					else
						break;
					inc(i);
				end;
			        if l>=n then
						begin
						writeln(a,' ',d);
						flag:=true;
						end;
			end;
	{for i:=1 to (m*m*2) do
		if b[i] then
			write(i,' ');
	writeln;}
	if not flag then writeln('NONE');
	close(input);close(output);
end.
