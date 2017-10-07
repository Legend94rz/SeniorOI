type
	node=record
		sum,d:longint;
		end;
var
	i,j,n,m,x,y,z:longint;
	//a:array[0..200001]of longint;
	f:array[0..800001]of node;
procedure buildtree(a,b,p:longint);
var
	k:longint;
begin
	if (a=b) then begin f[p].sum:=f[a].d;exit;end;
	k:=(a+b) shr 1;
	buildtree(a,k,p shl 1);
	buildtree(k+1,b,p shl 1+1);
	f[p].sum:=f[p shl 1].sum+f[p shl 1+1].sum;
end;
function ask(a,b,l,r,p:longint):longint;
var
	k:longint;
begin
	if (a=l)and(b=r) then exit(f[p].sum);
	k:=(a+b) shr 1;
	if k>=r then exit(ask(a,k,l,r,p shl 1));
	if k<l then exit(ask(k+1,b,l,r,p shl 1+1));
	exit(ask(a,k,l,k,p shl 1)+ask(k+1,b,k+1,r,p shl 1+1));
end;
procedure gai(a,b,x,p:longint);
var
	k:longint;
begin
	//writeln('test',a,' ',b,' ',p);
	if (a=b) and(b=x) then begin f[p].d:=0;f[p].sum:=0;exit;end;
	k:=(a+b) shr 1;
	if K>=x then gai(a,k,x,p shl 1);
	if k<x then gai(k+1,b,x,p shl 1+1);
	f[p].sum:=f[p shl 1].sum+f[p shl 1+1].sum;
end;
begin
	readln(n);
	for i:=1 to n do read(f[i].d);
	buildtree(1,n,1);
	readln(m);
	for i:=1 to m do
		begin
	        read(x,y);
			z:=ask(1,n,x,y,1);
			writeln(z*3.14:0:2);
			gai(1,n,(x+y)shr 1,1);
		end;
end.


