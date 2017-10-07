var
	i,j,n,m,ans:Longint;
	f:array[0..1001,0..6001]of longint;
	a,b:array[0..1001]of longint;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
begin
	assign(input,'boxes.in');reset(input);assign(output,'boxes.out');rewrite(output);
	readln(n);
	for i:=1 to n do readln(a[i],b[i]);
//Method One:
	for i:=n downto 1 do
		for j:=0 to 6001 do
			begin
				f[i,j]:=f[i+1,j];
				if (j>=a[i])and(f[i+1,j-a[i]]+1>f[i,j])and(b[i]>=j-a[i]) then
                    f[i,j]:=f[i+1,j-a[i]]+1;
            end;
	for i:=0 to 6001 do
		if f[1,i]>ans then
			ans:=f[1,i];
//Method Two:Cannot Accept
{	f[0,0]:=$3f3f3f3f;
	for i:=1 to n do
		for j:=i+1 to n+1 do
			f[i,j]:=-$3f3f3f3f;
	for i:=1 to n do
		for j:=1 to i do
			begin
				f[i,j]:=min(f[i-1,j-1]-a[i],b[i]);
				IF f[i-1,j]>f[i,j] then f[i,j]:=f[i-1,j];
            end;
	//writeln('>>',f[5,5]);
	{for i:=1 to n do
		begin
			for j:=1 to i do write(f[i,j],' ');
			writeln;
		end;}
	for j:=n downto 1 do
		if f[n,j]>=0 then
			begin
				writeln(j);
				exit;
			end;}
	writeln(ans);
	close(output);
end.

