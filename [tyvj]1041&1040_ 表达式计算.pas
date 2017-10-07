type
	arr=record
		d:array[0..2000]of longint;
		l:longint;
		end;
	node=record
		l,r:longint;
		end;
var
	i,j,n,m:longint;
	a,b:array[0..2000]of arr;
	op:array[0..2000]of boolean;//false-减;true-加;
	s:array[0..2000]of char;
	num:array[0..2000]of node;
	nl:longint;
operator >(a,b:arr)ans:boolean;
var
	i:longint;
begin
	if a.l>b.l then exit(true);
	if a.l<b.l then exit(false);
	for i:=a.l downto 1 do
		if a.d[i]>b.d[i] then
			exit(true)
		else
			if a.d[i]<b.d[i] then exit(false);
	exit(false);
end;
operator -(a,b:arr)ans:arr;
var
	i,l:Longint;
begin
	if a.l<b.l then a.l:=b.l;
	for i:=1 to a.l do
		if a.d[i]>=b.d[i] then
			a.d[i]:=a.d[i]-b.d[i]
		else
			begin
				inc(a.d[i],10);
				a.d[i+1]:=(a.d[i+1]-1);
				a.d[i]:=a.d[i]-b.d[i];
			end;
	inc(a.l,3);
	while a.d[a.l]=0 do dec(a.l);
	if a.l=0 then a.d[0]:=0;
	exit(a);
end;
operator +(a,b:arr)ans:arr;
var
	i:longint;
begin
	if a.d[0]=-1 then begin a.d[0]:=0;a:=b-a;exit(a);end;
	if a.l<b.l then a.l:=b.l;
	for i:=1 to a.l do
		begin
			a.d[i]:=a.d[i]+b.d[i];
			inc(a.d[i+1],a.d[i] div 10);
			a.d[i]:=a.d[i] mod 10;
        end;
	if a.d[a.l]>0 then inc(a.l);
	exit(a);
end;
procedure print(a:arr);
var
	i:longint;
begin
	if a.d[0]=-1 then write('-');
	while (a.d[a.l]=0) do dec(a.l);
	for i:=a.l downto 1 do write(a.d[i]);
	if a.l<=0 then write(0);
	writeln;
end;
begin
	//assign(input,'input.txt');reset(input);assign(output,'output.txt');rewrite(output);
	while not eoln do
		begin
			inc(I);
			read(s[i]);
        end;readln;
	n:=i;i:=0;num[1].l:=1;
	for i:=1 to n do
		if not (s[i] in ['0'..'9']) then
			begin
				inc(j);
				op[j]:=s[i]='+';
				num[j].r:=i-1;num[j+1].l:=i+1;
			end;
	nl:=j+1;m:=j;
	num[nl].r:=n;
	//writeln('num=',nl,' op=',j);
	//for i:=1 to nl do writeln(num[i].l,'-',num[i].r);
	for i:=1 to nl do
		for j:=num[i].r downto num[i].l do
			begin
				inc(a[i].l);
				a[i].d[a[i].l]:=ord(s[j])-48;
        	end;
	{for i:=1 to nl do
		begin
        	for j:=a[i].l downto 1 do
				write(a[i].d[j]);
			writeln;
		end;}
	for i:=1 to m do
		if op[i] then
			a[1]:=a[1]+a[i+1]
		else
			if a[1].d[0]=0 then
				if a[1]>a[i+1] then
					a[1]:=a[1]-a[i+1]
				else
					begin
						a[1]:=a[i+1]-a[1];
						a[1].d[0]:=-1;
					end
			else
				begin
					a[1].d[0]:=0;
					a[1]:=a[1]+a[i+1];
					a[1].d[0]:=-1;
                end;
	print(a[1]);
	//close(output);
end.

