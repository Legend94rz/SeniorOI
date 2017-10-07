program prim;
var
	know:array[0..1001]of boolean;
	d:array[0..1001]of double;
	x,y,z:array[0..1001]of int64;
	i,j,k,n,p:longint;
	f:boolean;
	t,min:double;
function cal(u,v:Longint):double;
begin
	//write(u,' ',v);
	exit(sqrt(sqr(x[u]-x[v])+sqr(y[u]-y[v])+sqr(z[u]-z[v])));
end;
begin
	x[1]:=-1;y[1]:=-1;z[1]:=-1;
	i:=1;
	while not eof do
		begin
			inc(i);
			readln(x[i],y[i],z[i]);
		End;
	n:=i;
	for i:=1 to n do
		d[i]:=$7f7f7f7f;
	d[1]:=0;k:=1;
	while true do
		begin
			know[k]:=true;min:=$7f7f7f7f;f:=false;
			//writeln('k=',k);
			for i:=1 to n do
				begin
					t:=cal(k,i);//writeln(' ',t:0:4);
					if (t<d[i])and(i<>k)and(not know[i]) then
						d[i]:=t;
				end;
			for i:=1 to n do
				if not know[i] then
					if d[i]<min then
						begin
							min:=d[i];
							k:=i;
							f:=true;
						end;
			{for i:=1 to n do
				writeln(i,' ',know[i],' ',d[i]:0:4);}
			if not f then break;
		End;
	for i:=1 to n do
		begin
		d[0]:=d[i]+d[0];
		//writeln(i,' ',d[i]:0:4);
		End;
	writeln(d[0]:0:4);
end.
