var
	a,b,e:array[0..250500]of longint;
	father:array[0..250500]of longint;
	i,j,n,m,k,t,tot:longint;
	mst:int64;
	x,Y:longint;
procedure qsort(s,t:longint);
var
	i,j,k,Y:longint;
begin
	i:=s;j:=t;k:=e[(s+t)shr 1];
	repeat
		while e[j]>k do dec(j);
		while e[i]<k do inc(i);
		if i<=j then begin
			y:=a[i];a[i]:=a[j];a[j]:=y;
			y:=b[i];b[i]:=b[j];b[j]:=y;
			y:=e[i];e[i]:=e[j];e[j]:=y;
			inc(i);dec(j);
		end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
function getfather(x:longint):longint;
var
	t,f:longint;
begin
	t:=x;
	while father[x]<>x do x:=father[x];
	while father[t]<>x do
		begin
			f:=father[t];
			father[t]:=x;
			t:=f;
		end;
	exit(x);
end;
begin
	readln(m);
	for k:=1 to m do
		begin
			//readln;
			readln(n);mst:=0;tot:=0;
			for i:=1 to n*n do
				father[i]:=i;
			for i:=1 to n do
				for j:=1 to n do
					begin
						read(t);
						if (t<>0)and(j<=i) then begin
							inc(tot);
							a[tot]:=i;
							b[tot]:=j;
							e[tot]:=t;
						end;
					end;
			qsort(1,tot);
			{for i:=1 to tot-1 do
				write(e[i],' ');
			writelN(e[tot]);}
			for i:=1 to tot do
				begin
					x:=getfather(a[i]);
					y:=getfather(b[i]);
					if x<>y then
						begin
							father[x]:=y;
							if e[i]>mst then mst:=e[i];
						end;
				end;
			writeln(mst);	
		end;
end.
