program ty1047;
uses
	math;
type
	arr=array[0..100]of longint;
var
	i,j,n,m,k:longint;
	s:string;
	f,num:array[0..100,0..100]of arr;
function get(st,t:Longint):arr;
var
	i,j:Longint;
begin
	fillchar(get,sizeof(get),0);
	j:=t-st+1;
	for i:=st to t do
		begin
		get[j]:=ord(s[i])-48;
		dec(j);
		end;
	get[0]:=t-st+1;
end;
operator *(a,b:arr)c:arr;
var
	i,j:longint;
begin
	fillchar(c,sizeof(c),0);
	for i:=1 to a[0] do
		for j:=1 to b[0] do
			c[i+j-1]:=c[i+j-1]+a[i]*b[j];
	c[0]:=a[0]+b[0]+1;
	for i:=1 to c[0] do
		begin
			c[i+1]:=c[i+1]+c[i]div 10;
			c[i]:=c[i] mod 10;
		end;
	while (c[c[0]]=0)and(c[0]>1) do dec(c[0]);
end;
function max(a,b:arr):arr;
var
	i:longint;
begin
	if a[0]>b[0] then exit(a);
	if a[0]<b[0] then exit(b);
	for i:=a[0] downto 1 do
		if a[i]<b[i] then
			exit(b)
		else
			if a[i]>b[i] then
				exit(a);
end;
procedure print(a:arr);
var
	i:longint;
begin
	for i:=a[0] downto 1 do
		write(a[i]);
	writeln;
end;
begin
	readln(n,m);
	readln(s);
	for I:=1 to	length(s) do
		for j:=i to length(s) do
			begin
			num[i,j]:=get(i,j);
			{write('num[',i,',',j,']=');
			print(num[i,j]);}
			End;
	for I:=1 to length(s) do
		f[i,0]:=num[1,i];
	for I:=2 to n do
		for j:=1 to min(i-1,m) do
			for k:=j to i-1 do
				begin
				{writeln('------');
				write('f[',i,',',j,']=');print(f[i,j]);
				write('will * num[',K+1,',',i,']=');print(num[K+1,i]);}

				f[i,j]:=max(f[i,j],f[k,j-1]*num[k+1,i]);

				{write('final f[',i,',',j,']=');print(f[i,j]);
				writeln('------');}
				End;
	print(f[n,m]);
	//print(num[1,4]*num[1,1]);
end.
