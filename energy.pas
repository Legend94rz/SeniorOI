var
	a:array[0..2001]of longint;
	f:array[0..2001,0..2001]of longint;
	i,j,n,m,max,k,s,t:longint;
begin
	readln(n);
	for i:=1 to n do
	begin
		read(a[i]);
		a[i+n]:=a[i];
	end;
	for i:=2 to n do
		for s:=1 to n do
			begin
			t:=i+s-1;
			for K:=s to t-1 do
				{if (f[s,(t-1)mod n+1]<f[s,(k-1)mod n +1]+f[k mod n+1,(t-1)mod n+1]+a[s]*a[k mod n+1]*a[t mod n+1]) then
					f[s,(t-1)mod n+1]:=f[s,(k-1)mod n +1]+f[k mod n+1,(t-1)mod n+1]+a[s]*a[k mod n+1]*a[t mod n+1];}
				if (f[s,t]<f[s,k]+f[k+1,t]+a[s]*a[k+1]*a[t+1])then
					f[s,t]:=f[s,k]+f[k+1,t]+a[s]*a[k+1]*a[t+1];
			f[s+n,t+n]:=f[s,t];
			end;
	for i:=1 to n do
		{if(f[i,(i+n-2)mod n+1]>max)then
			max:=f[i,(i+n-2) mod n+1];}
		if(f[i,i+n-1]>max)then
			max:=f[i,i+n-1];
	writeln(max);
end.

