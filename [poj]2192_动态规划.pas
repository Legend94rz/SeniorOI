type
	arr=array[0..400]of char;
var
	i,j,n,m:longint;
	a,b,c:arr;
	ch:char;
	t,u:longint;
	f:array[0..401,0..401]of boolean;//数组一定要开得合适!!
	l:array[0..5]of longint;
procedure init(var a:arr;k:longint);
var
	i:longint;
begin
	ch:='A';
	while (ch in['A'..'z']) do
		begin
			read(ch);
			inc(l[k]);
            a[l[k]]:=ch;
		end;
	dec(l[k]);
end;
begin
	readln(t);
	for u:=1 to t do
		begin
			fillchar(l,sizeof(l),0);init(a,1);init(b,2);init(c,3);//writeln(l[1],' ',l[2],' ',l[3]);
			fillchar(f,sizeof(f),0);f[0,0]:=true;
			for i:=1 to l[1] do f[i,0]:=a[i]=c[i];
			for i:=1 to l[2] do f[0,i]:=b[i]=c[i];
			for i:=1 to l[1] do
				for j:=1 to l[2] do
					if (f[i-1,j]and(a[i]=c[i+j]))or(f[i,j-1]and(b[j]=c[i+j])) then
						f[i,j]:=true;
			{for i:=0 to l[1] do
				begin
				for j:=0 to l[2] do
					if f[i,j] then
						write('T')
					else
						write('F');
				writeln;
				end;}
			write('Data set ',u,': ');
			if f[l[1],l[2]] then
				writeln('yes')
			else
				writeln('no');
			readln;
        end;
end.

