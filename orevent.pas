var
   x,y:array[0..1005]of longint;
   i,j,n:longint;
   max,ans,t:double;
begin
	assign(input,'orevent.in');reset(input);assign(output,'orevent.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		readln(x[i],y[i]);
	ans:=maxlongint;
	for i:=1 to n do
		begin
			for j:=1 to n do
				begin
					t:=sqrt(sqr(x[j]-x[i])+sqr(y[j]-y[i]));
					if t>max then
						max:=t;
				end;
			if Pi*sqr(max)<ans then ans:=Pi*sqr(max);
		end;
	writelN(ans:0:4);
	close(input);close(output);
end.
