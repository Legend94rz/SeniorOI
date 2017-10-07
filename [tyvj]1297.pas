uses math;
var
	i,j,n,m,l,r,tmin,tmax:longint;
	fmin,fmax,a:array[0..650000]of longint;
procedure buildtree(l,r,p:longint);
var
	k:longint;
begin
	if(l=r) then begin fmin[p]:=a[l];fmax[p]:=a[l];exit;end;
	k:=(l+r)shr 1;
	buildtree(l,k,2*p);
	buildtree(k+1,r,2*p+1);
	fmin[p]:=min(fmin[p*2],fmin[2*p+1]);
	fmax[p]:=max(fmax[2*p],fmax[2*p+1]);
end;
procedure ask(a,b,l,r,p:longint;var cx,cn:longint);
var
	k,tx,tn:longint;
begin
	if (a=l)and(b=r) then begin cx:=fmax[p];cn:=fmin[p];exit;end;
	k:=(a+b)shr 1;
	if r<=k then
		begin
			ask(a,k,l,r,2*p,cx,cn);exit;
		end;
	if l>k then
		begin
			ask(k+1,b,l,r,2*p+1,cx,cn);exit;
		end;
	ask(a,k,l,k,2*p,cx,cn);tx:=cx;tn:=cn;
	ask(k+1,b,k+1,r,2*p+1,cx,cn);
	cx:=max(tx,cx);cn:=min(tn,cn);
end;
begin
	readln(n,m);
	for i:=1 to n do
		read(a[i]);
	buildtree(1,n,1);
	for i:=1 to m do
		begin
			readln(l,r);//tmin:=0;tmax:=0;
			ask(1,n,l,r,1,tmin,tmax);
			writeln(tmin,' ',tmax);
		end;
end.

