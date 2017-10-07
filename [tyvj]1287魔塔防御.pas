var
	i,j:longint;
	n:longint;
	f:array[0..1030,0..1030]of int64;
	ans,r,g,b,t:int64;
function max(a,b:int64):int64;
begin
	if a>b then exit(a);
	exit(b);
end;
begin
	readln(n,r,g,b,t);
	for i:=1 to n do f[0,i]:=f[0,i-1]+(i-1)*g*t;
	for i:=1 to n-1 do
		for j:=0 to n-i do
			begin
	            f[i,j]:=max(f[i-1,j]+((i-1)*b+t)*g*j,f[i,j-1]+(b*i+t)*g*(j-1) );
				ans:=max(ans,f[i,j]+(b*i+t)*(n-i-j)*(r+g*j));
			end;
	writeln(ans);
end.

