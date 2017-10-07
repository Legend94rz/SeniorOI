type
	item=record
		cost,num,value,a,b:longint;
		end;
var
	i,j,n,m,x,y,z,k:Longint;
	a:array[0..201]of item;
	cata:array[0..201]of longint;
	f:array[0..10001]of longint;
procedure mutiplepack(total,cost,value:longint);
var
	k,t,j:longint;
begin
	t:=total;k:=1;
	while t>0 do
		begin
			if k>t then k:=t;
			for j:=m downto k*cost do
				if f[j-k*cost]+k*value>f[j] then
					f[j]:=f[j-k*cost]+k*value;
			t:=t-k;
			k:=k shl 1;
        end;
end;
begin
	assign(input,'pack.in');reset(input);assign(output,'pack.out');rewrite(output);
	readln(n,m);
	for i:=1 to n do
		begin
			read(x);cata[i]:=x;
			case x of
				1:readln(a[i].a,a[i].b);
				2:readln(a[i].value,a[i].cost,a[i].num);
				3:readln(a[i].value,a[i].cost);
				end;
        end;
	for I:=1 to n do
		case cata[i] of
			1:for j:=m downto 0 do
				for k:=0 to j do
					if f[j-k]+a[i].a*k*k-a[i].b*K>f[j] then
						f[j]:=f[j-k]+a[i].a*k*k-a[i].b*K;
			2:mutiplepack(a[i].num,a[i].cost,a[i].value);
			3:for j:=a[i].cost to m do
				if f[j-a[i].cost]+a[i].value>f[j] then
					f[j]:=f[j-a[i].cost]+a[i].value;
		end;
	writeln(f[m]);
	close(output);
end.

