var
	i,j,k,n,m,ans,t:longint;
	f:array[0..1,0..201,0..201]of longint;
	c:array[0..201,0..201]of longint;
	a:array[0..1001]of longint;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
begin
	assign(input,'service.in');reset(input);assign(output,'service.out');rewrite(output);
	readln(n,m);
	for i:=1 to n do
		for J:=1 to n do
			read(c[i,j]);
	for i:=1 to m do read(a[i]);
	fillchar(f,sizeof(f),$3f);
	f[1,1,2]:=c[3,a[1]];
	f[1,1,3]:=c[2,a[1]];
	f[1,2,3]:=c[1,a[1]];
	for i:=1 to m do
		begin
			t:=i mod 2;
			for j:=1 to n do
				if j<>a[i-1] then 
				for k:=1 to n do
					if k<>a[i-1] then
						if j<>k then 
					begin
						f[t,j,k]:=min(f[t,j,k],f[1-t,j,k]+c[a[i-1],a[i]]);
						f[t,k,a[i-1]]:=min(f[t,k,a[i-1]],f[1-t,j,k]+c[j,a[i]]);
						f[t,j,a[i-1]]:=min(f[t,j,a[i-1]],f[1-t,j,k]+c[k,a[i]]);
                	end;
			fillchar(f[(i+1) mod 2],sizeof(f[(i+1) mod 2]),$3f);
		end;
	ans:=maxlongint;t:=m mod 2;
	for i:=1 to n do
		for j:=1 to n do
			begin
				ans:=min(ans,f[t,i,j]);
				ans:=min(ans,f[t,i,a[m]]);
				ans:=min(ans,f[t,j,a[m]]);
            end;
	writeln(ans);
	close(output);
end.

