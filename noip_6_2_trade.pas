type
	arr=array[0..200]of longint;
var
	i,j,n,m,y:longint;
	a:array[0..100005]of longint;
	ans,x:arr;
function cfd(f:longint;s:arr;bol:boolean):arr;
var
	i,j:longint;
begin
	for i:=1 to 100 do
		s[i]:=s[i]*f;
	for i:=1 to 100 do
		begin
			s[i+1]:=s[i] div 10+s[i+1];
			s[i]:=s[i]mod 10;
		end;
	s[0]:=0;
	if bol then x:=s;
	exit(s);
end;
function add(a,b:arr):arr;
var
	i:longint;
begin
	for i:=1 to 100 do
		a[i]:=a[i]+b[i];
	for i:=1 to 100 do
		begin
			a[i+1]:=a[i+1]+a[i] div 10;
			a[i]:=a[i] mod 10;
		end;
	exit(a);
end;
begin
	assign(input,'trade.in');reset(input);
	readln(y,n);
	x[1]:=1;
	for i:=0 to n do
		readln(a[i]);
	ans[1]:=a[0];
	for i:=1 to n do
		ans:=add(ans,cfd(a[i],cfd(y,x,true),false));
	for i:=100 downto 1 do
		write(ans[i]);
	writeln;
	close(input);
end.
