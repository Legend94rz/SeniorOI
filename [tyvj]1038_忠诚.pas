var
	i,j,n,m,x,y:Longint;
	a,f:array[0..400001]of longint;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
function ask(a,b,l,r,p:longint):longint;
var
	k:Longint;
begin
	if (a=l)and(b=r) then exit(f[p]) ;
	k:=(a+b) shr 1;
	if r<=k then exit(ask(a,k,l,r,p shl 1));
	if l>k then exit(ask(k+1,b,l,r,p shl 1+1));
	exit(min(ask(a,k,l,k,p shl 1),ask(k+1,b,K+1,r,p shl 1+1)));
end;
procedure buildtree(l,r,P:longint);
var
	k:longint;
begin
	if (l=r) then begin f[p]:=a[l];exit;end;
	k:=(l+r)shr 1;
	buildtree(l,k,p shl 1);
	buildtree(k+1,r,p shl 1+1);
	f[p]:=min(f[p shl 1],f[p shl 1+1]);
end;
begin
	readln(n,m);
	for i:=1 to n do read(a[i]);
	buildtree(1,n,1);
	for i:=1 to m do
		begin
			readln(x,y);
			write(ask(1,n,x,y,1),' ');
        end;
	writeln;
end.


