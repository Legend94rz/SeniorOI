type
	tree=record
		sum,yan:longint;
		end;
var
	f:array[0..400001]of tree;
	x,y,z:longint;
	n,i,j:Longint;
procedure gai(a,b,l,r,p:longint);
var
	k:longint;
begin
	if (a=l)and(b=r) then begin inc(f[p].yan);exit;end;
	inc(f[p].sum,(r-l+1));
	k:=(a+b) shr 1;
	if r<=k then begin gai(a,k,l,r,p shl 1);exit;end;
	if l>k then begin gai(k+1,b,l,r,p shl 1+1);exit;end;
	gai(a,k,l,k,p shl 1);gai(k+1,b,k+1,r,p shl 1+1);
end;
function ask(a,b,x,p:Longint):longint;
var
	k:longint;
begin
	if f[p].yan<>0 then
		begin
			inc(f[p shl 1].yan,f[p].yan);
			inc(f[p shl 1+1].yan,f[p].yan);
			inc(f[p].sum,f[p].yan*(b-a+1));
			f[p].yan:=0;
        end;
	if (a=x)and(b=x) then exit(f[p].sum);
	k:=(a+b) shr 1;
	if x<=k then exit(ask(a,k,x,p shl 1));
	exit(ask(K+1,b,x,p shl 1+1));
end;
begin
	readln(n);
	fillchar(f,sizeof(f),0);
	for i:=1 to n do
		begin
			readln(x,y);
			gai(1,50001,x+1,y+1,1);
        end;
	readln(n);
	for i:=1 to n do
		begin
			readln(x);
			writeln(ask(1,50001,x+1,1));
		end;
end.

