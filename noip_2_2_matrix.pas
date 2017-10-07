var
	ans,max,h,m,n,h1,h2,h3,m1,m2,hh,mm,nn:longint;
	g,w:array[0..200,0..200,0..200]of longint;
	
procedure main;{数组顺序有所不同}
begin
	for hh:=1 to h do
		for mm:=1 to m do
			for nn:=1 to n do
				g[hh,mm,nn]:=g[hh,mm-1,nn]+g[hh-1,mm,nn]-g[hh-1,mm-1,nn]+w[hh,mm,nn]; //预处理
	ans:=0;
	for h1:=1 to h do
		for h2:=h1 to h do
			for m1:=1 to m do
				for m2:=m1 to m do
				begin
					max:=0;
					for nn:=1 to n do
						begin
							max:=max+g[h2,m2,nn]-g[h2,m1-1,nn]-g[h1-1,m2,nn]+g[h1-1,m1-1,nn];
							if max>ans then ans:=max; //更新最优值
							if max<0 then max:=0; //清零
						end;
				end;
end;
begin
	readln(h,m,n);
	for hh:=1 to h do
		for mm:=1 to m do
			for nn :=1 to n do
				read(w[hh,mm,nn]);
	main;
	for hh:=1 to h do
		begin
			for mm:=1 to m do
				begin
				for nn :=1 to n do
					write(g[hh,mm,nn]:3);
				writeln;
				end;
			writeln;
		end;
	writeln(ans);
end.
