type
	tree=record
		sum,yan:int64;
	end;
var
	i,j,n,m,x,y:longint;
	z:int64;
	ct:char;
	f:array[0..600001]of tree;
	a:array[0..150001]of longint;
procedure build(l,r,p:longint);
var
	k:longint;
begin
	if (l=r) then begin f[p].sum:=a[l];exit;end;
	k:=(l+r) shr 1;
	build(l,k,p shl 1);
	build(k+1,r,p shl 1+1);
	f[p].sum:=f[p shl 1].sum+f[p shl 1+1].sum;
end;
function ask(a,b,l,r,p:longint):int64;
var
	k:longint;
begin
	if f[p].yan<>0 then
		begin
			inc(f[p shl 1].yan  ,f[p].yan);
			inc(f[p shl 1+1].yan,f[p].yan);
			inc(f[p].sum,f[p].yan*(b-a+1));
			f[p].yan:=0;
        end;
	if (a=l)and(b=r) then exit(f[p].sum);
	k:=(a+b) shr 1;
	if (r<=k) then exit(ask(a,k,l,r,p shl 1));
	if (l>k) then exit(ask(k+1,b,l,r,p shl 1+1));
	exit(ask(a,k,l,k,p shl 1)+ask(k+1,b,k+1,r,p shl 1+1));
end;
procedure gai(a,b,l,r:longint;c:int64;p:longint);
var
	k:longint;
begin
	if (a=l)and(b=r) then begin inc(f[p].yan,c);exit;end;
	if c<>0 then
		begin
			inc(f[p].sum,c*(r-l+1));
			k:=(a+b) shr 1;
			if (r<=k) then begin gai(a,k,l,r,c,p shl 1);exit;end;
			if (l>k) then begin gai(k+1,b,l,r,c,p shl 1+1);exit;end;
			gai(a,k,l,k,c,p shl 1);gai(k+1,b,k+1,r,c,p shl 1+1);//左右指针易打错，要注意
        end;
end;
begin
	readln(n,m);
	for i:=1 to n do read(a[i]);
	readln;
	build(1,n,1);
	for i:=1 to m do
		begin
			read(ct);
			if ct='Q' then
				begin
					readln(x,y);
					writeln(ask(1,n,x,y,1));
                end
			else
				begin
					readln(x,y,z);
					gai(1,n,x,y,z,1);
                end;
        end;
end.

