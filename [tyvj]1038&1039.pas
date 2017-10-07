var
	a,f:array[0..400000]of longint;
	n,m,ctrl,i,j,udg_l,udg_r:longint;
	ans:array[1..100000]of longint;
function min(a,b:longint):longint;
begin
	if(a<b)then exit(a);
	exit(b);
end;
function ask(a,b,l,r,p:longint):longint;
var
	k:longint;
begin
	if(a=l)and(b=r)then exit(f[p]);
	k:=(a+b) shr 1;
	if(r<=k)then exit(ask(a,k,l,r,p shl 1));
	if(l>k)then exit(ask(k+1,b,l,r,p shl 1+1));
	exit(min( ask(a,k,l,k,p shl 1),ask(k+1,b,k+1,r,p shl 1+1) ));
end;
procedure buildtree(l,r,p:longint);
var
	k:longint;
begin
	if(l=r)then begin f[p]:=a[l];exit;end;
	k:=(l+r)shr 1;
	buildtree(l,k,p shl 1);
	buildtree(k+1,r,p shl 1 + 1);
	f[p]:=min(f[p shl 1 ],f[p shl 1+1]);
end;
procedure update(a,l,r,p:longint);
var
	k:longint;
begin
	if(l=a)and(r=a)then begin f[p]:=udg_r;exit;end;
	k:=(l+r)shr 1;
	if(a<=k)then update(a,l,k,p shl 1);
	if(a>k)then update(a,k+1,r,p shl 1+1);
	f[p]:=min(f[p shl 1],f[p shl 1 +1]);
end;
begin
	readlN(n,m);
	for i:=1 to n do
		read(a[i]);
	buildtree(1,n,1);
        for i:=1 to 100000 do ans[i]:=-maxlongint;
	for j:=1 to m do
		begin
			readln(ctrl,udg_l,udg_r);
			if(ctrl=1)then
				ans[j]:=ask(1,n,udg_l,udg_r,1)
				//writeln(ask(1,n,udg_l,udg_r,1)
			else
				update(udg_l,1,n,1);
		end;
	for j:=1 to m do
		if(ans[j]<>-maxlongint)then write(ans[j],' ');
end.
