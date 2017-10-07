type
	arr=array[0..101,0..101]of longint;
var
	i,j,n,m,t,x,y:longint;
	up,right:array[0..101,0..101]of boolean;
	cow:array[0..101,1..2]of longint;
	a:arr;
	ans:boolean;
function check(key:longint;a:arr):boolean;
var
	i,j:longint;flag:boolean;
begin
	a[cow[key,1],cow[key,2]]:=0;
	for i:=1 to n do right[i,m]:=true;
	for i:=1 to m do up[1,i]:=true;
	for i:=1 to n do
		begin
			flag:=true;
			for j:=m-1 downto 1 do
				begin
					if a[i,j+1]>0 then flag:=false;
					right[i,j]:=flag;
         		end;
		end;
	for j:=1 to m do
		begin
			flag:=true;
			for i:=2 to n do
				begin
					if a[i-1,j]>0 then flag:=false;
					up[i,j]:=flag;
				end;
		end;
	{if key=1 then
		for i:=1 to n do
			begin
			for j:=1 to m do
				if up[i,j] then
					write('T')
				else
					write('F');
			writeln;
			end;}
	for i:=1 to n do
		for j:=1 to m do
			if (not right[i,j])and(not up[i,j])and(a[i,j]>0) then
				exit(false);
	exit(true);
end;
begin
	read(n,m);
	read(t);
	for I:=1 to t do
		begin
	        read(x,y);
			cow[i,1]:=x;cow[i,2]:=y;
			a[x,y]:=i;
		end;
	ans:=false;
	for i:=0 to t do
		if check(i,a) then
			begin
				if i<>0 then writeln(1);
		        writeln(i);
				ans:=true;
				exit;
			end;
	if not ans then writeln(-1);
end.

