var
	i,j,n,k,ans:longint;
	d,f:array[1..100000]of longint;
	x,y,z,a,b,c:longint;
function find(x:longint):longint;
var
	t,c,tx:longint;
begin
	if(x=f[x]) then exit (x);
	tx:=find(f[x]);
	d[x]:=(d[x]+d[f[x]])mod 3;//¹Ø¼ü
	f[x]:=tx;
	exit(f[x]);
end;
begin
	readln(n,k);
	for i:=1 to n do f[i]:=i;
	for i:=1 to k do
		begin
			readln(a,b,c);
			if ((a=2)and(b=c))or(b>n)or(c>n) then begin inc(ans);continue;end;
			x:=find(b);y:=find(c);
			if x<>y then
				begin
					f[y]:=x;
					d[y]:=(d[b]+a-1+3-d[c])mod 3;
				end
			else
				if ((3-d[b]+d[c])mod 3<>a-1) then
					inc(ans);
		end;
	writeln(ans);
end.
