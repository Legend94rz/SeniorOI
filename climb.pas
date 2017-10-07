var
	a,f,ans:array[0..400000]of longint;
	i,j,p,q,n,m:longint;
	l,r:array[0..7000]of longint;
function max(a,b:longint):longint;
begin
	if(a>=b)then exit(a);
	exit(b);
end;
function ask(a,b,l,r,q:longint):longint;
var
	k:longint;
begin
	if(a=l)and(b=r)then exit(f[q]);
	k:=(a+b)div 2;
	if(r<=k)then exit(ask(a,k,l,r,2*q));
	if(l>k)then exit(ask(k+1,b ,l,r,2*q+1));
	exit(max(ask(a,k,l,k,2*q),ask(k+1,b,k+1,r,2*q+1)))
end;
procedure buildtree(l,r,q:longint);
var
	mid,k:longint;
begin
	if(l=r)then begin f[q]:=a[l]; exit;end;
	mid:=(l+r)div 2;
	buildtree(l,mid,2*q);
	buildtree(mid+1,r,2*q+1);
        f[q]:=max(f[2*q],f[2*q+1]);
end;
begin
	assign(input,'climb.in');assign(output,'climb.out');reset(input);rewrite(output);
	readln(n);
	for i:=0 to n do
		readln(a[i]);
	readln(m);
	for i:=1 to m do
		readln(l[i],r[i]);
	buildtree(0,n,1);
	for i:=1 to m do
	begin
		ans[i]:=ask(0,n,l[i],r[i],1);
		writeln(ans[i]);
	end;
	close(input);close(output);
end.
