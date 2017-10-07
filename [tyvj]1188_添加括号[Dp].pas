 var
	i,j,n,m,l,t,p,k:longint;
	f:array[0..101,0..101]of longint;
	s,a:array[0..101]of longint;
	g:array[0..101,0..101]of longint;
	ans:string;
begin
	readln(n);fillchar(f,sizeof(f),$3f);
	for i:=1 to n do begin read(a[i]);f[i,i]:=0;s[i]:=s[i-1]+a[i];ans:=ans+chr(a[i]+48)+'+';end;
	delete(ans,length(ans),1);
	for L:=2 to n do
		for i:=1 to n-L+1 do
			begin
				j:=i+L-1;
				for k:=i to j-1 do
						if f[i,k]+f[k+1,j]+s[j]-s[i-1]<f[i,j] then
							begin
								f[i,j]:=f[i,k]+f[K+1,j]+s[j]-s[i-1];
								g[i,j]:=k;t:=k;
                			end;
			end;
    writeln(f[1,n]);
end.

