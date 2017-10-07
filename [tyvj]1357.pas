var
	i,j,n,m:longint;
        ans:double;
	d:array[0..1001]of double;
	know:array[0..1001]of boolean;
	x,y:array[0..1001]of longint;
	e:array[0..1001,0..1001]of double;
procedure prim;
var
	i,k:longint;
        p:longint;
        min:double;
begin
	for i:=1 to n do d[i]:=maxlongint;k:=0;
	while true do begin
		know[k]:=true;
		for i:=1 to n do
			if (e[k,i]<d[i])and(not know[i]) then
				d[i]:=e[k,i];
		min:=maxlongint;
		for i:=1 to n do
			if (d[i]<min)and(not know[i]) then
				begin
					min:=d[i];
					k:=i;
				end;
		if min=maxlongint then break;
	end;
	for i:=1 to n do
		ans:=ans+d[i];
end;
begin
	readln(n);
	for i:=1 to n do
		for j:=1 to n do
			e[i,j]:=maxlongint;
	for i:=1 to n do
		begin
			readln(x[i],y[i]);
			e[0,i]:=sqrt(sqr(x[i])+sqr(y[i]) );e[i,0]:=e[0,i];
		end;
	for i:=1 to n do
		for j:=1 to n do
			begin
				e[i,j]:=sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j]) );
				e[j,i]:=e[i,j];
			end;
	prim;
	writeln(ans:0:2);
end.

