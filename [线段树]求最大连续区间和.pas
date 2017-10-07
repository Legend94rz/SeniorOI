type
	node=record
			sum,lr,rl,sm:longint;
		end;
var
	a:array[0..100001]of longint;
	t:array[0..400001]of node;
	i,j,n,m,x,y:longint;
	ch:BYTE;
function max(a,b,c:longint):longint;
begin
	max:=a;
	if max<b then max:=b;
	if max<c then max:=c;
end;
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
procedure gai(l,r,x,y,p:longint);
var
	k:longint;
begin
	if (l=r)and(l=x) then begin t[p].sum:=y;t[p].lr:=y;t[p].rl:=y;t[p].sm:=y;exit;end;
	k:=(L+r) shr 1;
	if X<=k then gai(l,k,x,Y,p shl 1)ELSE gai(k+1,r,x,Y,p shl 1+1);
	t[p].sum:=t[p shl 1].sum+t[p shl 1+1].sum;
	t[p].sm:=max(t[p shl 1].sm,t[p shl 1+1].sm,t[p shl 1].rl+t[p shl 1+1].lr);
	t[p].rl:=max(t[p shl 1+1].rl,t[p shl 1+1].sum+t[p shl 1].rl);
	t[p].lr:=max(t[p shl 1].lr,t[p shl 1].sum+t[p shl 1+1].lr);
end;
function ask(a,b,l,r,p:longint):node;
var
	k:longint;
	z,y:node;
begin
	if (a=l)and(b=r) then exit(t[p]);
	k:=(a+b)shr 1;
	if (r<=k) then 	exit(ask(a,k,l,r,p shl 1));
	if (l>k) then 	exit(ask(k+1,b,l,r,p shl 1+1));
	z:=ask(a,k,l,k,p shl 1);
    y:=ask(k+1,b,k+1,r,p shl 1+1);
	ask.sm:=max(z.sm,y.sm,z.rl+y.lr);
	ask.lr:=max(z.lr,z.sum+y.lr);
	ask.rl:=max(y.rl,z.rl+y.sum);
	ask.sum:=z.sum+y.sum;
end;
procedure buildtree(l,r,p:longint);
var
	k:longint;
begin
	if (l=r) then begin t[p].sum:=a[l];t[p].lr:=a[l];t[p].rl:=a[l];t[p].sm:=a[l];exit;end;
	k:=(L+r) shr 1;
	buildtree(l,k,p shl 1);buildtree(k+1,r,p shl 1+1);
	t[p].sum:=t[p shl 1].sum+t[p shl 1+1].sum;
	t[p].sm:=max(t[p shl 1].sm,t[p shl 1+1].sm,t[p shl 1].rl+t[p shl 1+1].lr);
	t[p].rl:=max(t[p shl 1+1].rl,t[p shl 1+1].sum+t[p shl 1].rl);
	t[p].lr:=max(t[p shl 1].lr,t[p shl 1].sum+t[p shl 1+1].lr);
end;
begin
	readln(n,m);
	for i:=1 to n do read(a[i]);
	buildtree(1,n,1);
	for i:=1 to m do
		begin
			read(ch);
			case ch of
				1:begin readln(x,y);writeln(ask(1,n,x,y,1).sm);end;
				2:begin readln(x,y);gai(1,n,x,y,1);end;
				end;
		end;
end.

