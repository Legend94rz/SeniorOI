var
	i,j,n,m,ans:longint;
	x,y:longint;
	f:array[0..800001]of longint;//0-黑;1-白
procedure buildtree;
begin
	fillchar(f,sizeof(f),0);
end;
procedure gai(a,b,l,r,c,p:longint);
var
	k:longint;
begin
	if (a=l)and(b=r) then begin f[p]:=c;exit;end;
	if f[p]<>-1 then
		begin
			f[p shl 1]:=f[p];
			f[p shl 1+1]:=f[p];
			if f[p]<>c then f[p]:=-1;
        end;
	k:=(a+b)shr 1;
	if r<=k then begin gai(a,k,l,r,c,p shl 1);exit;end;
	if l>k then begin gai(k+1,b,l,r,c,p shl 1+1);exit;end;
	gai(a,k,l,k,c,p shl 1);gai(k+1,b,k+1,r,c,p shl 1+1);
end;
procedure count(a,b,l,r,p:Longint);
var
	k:longint;
begin
	//count:=0;
	if (a=l)and(b=r) then
        begin
            if f[p]=0 then ans:=ans+(r-l+1);
            //writeln('at ',p,'(',l,' ',r,')');
            if f[p]<>-1 then exit;//如果是个纯色点不要再往下找，因为有可能下面的点都未被更新，这是由于线段树的染色方式所决定的
        end;
	if (l=r) then exit;//如果找到的是单点，不要再往下找了。
	k:=(a+b) shr 1;
	if r<=k then begin count(a,k,l,r,p shl 1);exit;end;
	if l>k then begin count(k+1,b,l,r,p shl 1+1);exit;end;
	count(a,k,l,k,p shl 1);count(k+1,b,K+1,r,p shl 1+1);
end;
begin
	readln(n,m);
	buildtree;
	for i:=1 to m do
		begin
			readln(x,y);
			gai(1,n,x,y,1,1);ans:=0;
            //write('>>');for j:=1 to 25 do write(f[j],' ');writeln;
            count(1,n,1,n,1);
			writeln(ans);
        end;
end.

