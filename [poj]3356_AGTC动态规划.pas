var
	i,j,n,m:longint;
	f:array[0..1001,0..1001]of longint;
	a,b:array[0..1001]of char;
	ch:char;
function min(a,b,c:longint):longint;
begin
	min:=a;
	if min>b then min:=b;
	if min>c then min:=c;
	exit(min);
end;
begin
	//assign(input,'test.txt');reset(input);
	while not eof do begin
	read(n);read(ch);
	for i:=1 to n do
		begin
			read(ch);a[i]:=ch;
        end;
	readln;
	read(m);read(ch);//readln;
	for i:=1 to m do
		begin
			read(ch);b[i]:=ch;
		end;
	readln;
	fillchar(f,sizeof(f),$3f);f[0,0]:=0;
	for i:=1 to n do f[i,0]:=i;
	for i:=1 to m do f[0,i]:=i;
	for i:=1 to n do
		for j:=1 to m do
			if a[i]<>b[j] then
				f[i,j]:=min(f[i-1,j]+1,f[i,j-1]+1,f[i-1,j-1]+1)
			else
				f[i,j]:=f[i-1,j-1];
	{for i:=0 to n do
		begin
        for j:=0 to m do
			write(f[i,j],' ');
		writeln;
		end;}
	writeln(f[n,m]);
	end;
    //close(input);
end.

