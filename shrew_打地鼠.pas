var
	i,j,n,m,c,r,t:longint;
	ans:int64;
	a,b:array[0..200,0..200]of longint;
function check(r,c:longint):longint;
var
	i,j,x,y,z:longint;
	step:int64;
begin
	step:=0;b:=a;
	for i:=1 to n-r+1 do
		for j:=1 to m-c+1 do
			begin
				z:=b[i,j];if z=0 then continue;
				for x:=i to i+r-1 do
					for y:=j to j+c-1 do
						if b[x,y]-z<0 then
							exit(-2)
						else
							begin
								if step>ans then exit(-1);
								dec(b[x,y],z);
							end;
				inc(step,z);
            end;
	for x:=1 to n do
		for y:=1 to m do
			if b[x,y]>0 then
				exit(-3);
	exit(step);
end;
begin
	assign(input,'shrew.in');reset(input);assign(output,'shrew.out');rewrite(output);
	readln(n,m);
	for i:=1 to n do
		for j:=1 to m do
			begin
	            read(a[i,j]);
				inc(ans,a[i,j]);
			end;
	for r:=n downto 1 do
		for c:=m downto 1 do
			if ans mod (r*c)=0 then
            begin
				t:=check(r,c);//writeln(r,' ',c,' ',t);
				if (t>0) then ans:=t;
            end;
	writeln(ans);close(output);
end.

