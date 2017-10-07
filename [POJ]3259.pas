var
	n,m,f,w,i,j,k,tot,x,y,z:longint;
        flag:boolean;
	d:array[0..5500]of longint;
	a,b,e:array[0..7000]of longint;
procedure add(x,y,z:longint);
begin
	inc(tot);
	a[tot]:=x; b[tot]:=y; e[tot]:=z;
end;
function ford:boolean;
begin
	fillchar(d,sizeof(d),$3f);d[1]:=0;
	for j:=0 to n do
		begin
			flag:=false;
			for k:=1 to tot do
				if d[a[k]]+e[k]<d[b[k]] then
					begin
						flag:=true;
						d[b[k]]:=d[a[k]]+e[k];
					end;
			if not flag then exit(true);
		end;
	exit(false);
end;
begin
	readlN(f);
	for i:=1 to f do
		begin
			tot:=0;
			readln(n,m,w);
			for j:=1 to m do
				begin
					readln(x,y,z);
					add(x,y,z);
					add(y,x,z);
				end;
			for j:=m+1 to m+w do
				begin
					readln(x,y,z);
					z:=-z;
					add(x,y,z)
				end;
			if not ford then writeln('YES')
			else
				writeln('NO');
		end;
end.
