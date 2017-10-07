const
	p=1000000;
type
	arr=record
		d:array[0..301]of longint;
		l:longint;
		end;
var
	i,j,n,m:longint;
	f:array[0..1001]of arr;
	t:arr;
procedure print(a:arr);
var
	i:longint;
	ans,s:string;
begin
	ans:='';
	for i:=a.l downto 1 do
		begin
			str(a.d[i],s);
			if (s='0')and(i=a.l)and(i>1) then continue;
			while (length(s)<6)and(i<>a.l) do insert('0',s,1);
			ans:=ans+s;
		end;
	while (ans[1]='0')and(length(ans)>1) do delete(ans,1,1);
	writeln(ans);
end;
operator *(a:arr;b:longint)c:arr;
var
	i:longint;
begin
	fillchar(c,sizeof(c),0);c.l:=a.l+3;
	for i:=1 to c.l do
		begin
	        c.d[i]:=a.d[i]*b+c.d[i];
			inc(c.d[i+1],c.d[i] div p);
			c.d[i]:=c.d[i] mod p;
		end;
	while (c.d[c.l]=0)and(c.l>1) do dec(c.l);
end;
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
			if a.d[i]<b.d[i] then
				exit(false);
	exit(false);
end;
begin
	readln(n);
	f[0].d[1]:=1;f[0].l:=1;
	for i:=1 to n do
		for j:=n downto i do
			begin
				t:=f[j-i]*i;
				if t>f[j] then f[j]:=t;
			end;
	print(f[n]);
end.

