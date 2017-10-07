var
	a:array[0..4000,0..3]of longint;
	cd:array[0..40000]of longint;
	b:array[0..40000,0..3]of longint;
	n,m,i,j,v,p,q,s,t:longint;
	f:array[0..40000]of longint;
begin
	readln(n,m);
	n:=n div 10;
	for i:=1 to m do
		begin
			readln(v,p,q);
			v:=v div 10;
			a[i,0]:=v;a[i,1]:=p;a[i,2]:=q;
			a[i,3]:=i;
			if q<>0 then
				begin
					inc(cd[q]);
					b[q,cd[q]]:=i;
				end;
		end;
	for i:=1 to m do
		if a[i,2]=0 then
			for j:=n downto a[i,0] do
				begin
					if (f[j] < f[j-a[i,0]]+a[i,1]*a[i,0]) then
						f[j]:=f[j-a[i,0]]+a[i,1]*a[i,0];
					if (j >= a[i,0] + a[b[i,1],0])and(f[j] < f[j-a[i,0]-a[b[i,1],0]]+a[i,0]*a[i,1]+a[b[i,1],0]*a[b[i,1],1]) then
						f[j]:=f[j-a[i,0]-a[b[i,1],0]]+a[i,0]*a[i,1]+a[b[i,1],0]*a[b[i,1],1];
					if (j >= a[i,0] + a[b[i,2],0])and(f[j] < f[j-a[i,0]-a[b[i,2],0]]+a[i,0]*a[i,1]+a[b[i,2],0]*a[b[i,2],1]) then
						f[j]:=f[j-a[i,0]-a[b[i,2],0]]+a[i,0]*a[i,1]+a[b[i,2],0]*a[b[i,2],1];
					if (j >= a[i,0]+a[b[i,2],0]+a[b[i,1],0])and(f[j] < f[j-a[i,0]-a[b[i,1],0]-a[b[i,2],0]]+a[i,0]*a[i,1]+a[b[i,2],0]*a[b[i,2],1]+a[b[i,1],0]*a[b[i,1],1]) then
						f[j]:= f[j-a[i,0]-a[b[i,1],0]-a[b[i,2],0]]+a[i,0]*a[i,1]+a[b[i,2],0]*a[b[i,2],1]+a[b[i,1],0]*a[b[i,1],1];
				end;
	writeln(f[n]*10);
end.
