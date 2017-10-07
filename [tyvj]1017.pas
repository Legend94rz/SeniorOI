var
	i,j,m,n,x,y,a,b,ans:longint;
	father:array[0..2000]of longint;
function getfather(x:longint):longint;
{var
	t,c,z:longint;}
begin
	//t:=x;
	while father[x]<>x do x:=father[x];
	{z:=x;
	while father[t]<>z do
		begin
		c:=father[t];
		father[t]:=z;
		t:=c;		
		end;}
	exit(x);
end;
begin
	readln(n,m);
        for i:=1 to m do
                father[i]:=i;
	for i:=1 to n do
		begin
		readln(a,b);
		x:=getfather(a);
		y:=getfather(b);
		if x<>y then
			father[x]:=y
		else
			inc(ans);
		end;
	writeLN(ans);
end.
