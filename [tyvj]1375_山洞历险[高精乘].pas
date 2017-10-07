const
	p=100000000;
type
	node=record
			la:longint;
			d:array[0..1251]of int64;
		end;
var
	i,n:longint;
	a:node;
	f:array[0..2]of node;
operator *(a,b:node)ans:node;
var
	i,j:Longint;
begin
	fillchar(ans,sizeof(ans),0);ans.la:=a.la+b.la+10;
	for i:=1 to a.la do
		for j:=1 to b.la do
			ans.d[i+j-1]:=ans.d[i+j-1]+a.d[i]*b.d[j];
	for i:=1 to ans.la do
		begin
			ans.d[i+1]:=ans.d[i+1]+ans.d[i] div p;
			ans.d[i]:=ans.d[i]mod p;
        end;
	while (ans.d[ans.la]=0)and(ans.la>1) do dec(ans.la);
end;
operator +(a,b:node)ans:node;
var
	i:longint;
begin
	fillchar(ans,sizeof(ans),0);ans.la:=a.la;
	if a.la<b.la then ans.la:=b.la;
	for i:=1 to ans.la do
		begin
			ans.d[i]:=a.d[i]+b.d[i]+ans.d[i];
			ans.d[i+1]:=ans.d[i+1]+ans.d[i] div p;
			ans.d[i]:=ans.d[i] mod p;
		end;
	while ans.d[ans.la+1]>0 do inc(ans.la);
end;
procedure print(a:node);
var
	s:string;
begin
	write(a.d[a.la]);
	for i:=a.la-1 downto 1 do
		begin
			str(a.d[i],s);
			while length(s)<8 do s:='0'+s;
			write(s);
		end;
	writeln;
end;
function qm(a:node;b:longint):node;
begin
	qm.la:=1;qm.d[1]:=1;
	while b>0 do
		begin
			if b and 1=1 then qm:=qm*a;
			a:=a*a;
			b := b shr 1;
		end;
end;
begin
	readln(n);
	a.d[1]:=2;a.la:=1;
	print(qm(a,n));
	f[1].d[1]:=0;f[1].la:=1;
	f[2].d[1]:=1;f[2].la:=1;
	for i:=3 to n do f[i mod 3]:=f[(i-1)mod 3]+f[(i-2)mod 3];
	print(f[n mod 3]);
end.

