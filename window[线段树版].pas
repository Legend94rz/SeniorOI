var
	i,j,n,m,low,high,k:longint;
	a,fm,fn:array[0..4000001]of longint;
	ansa,ansb:array[0..1000001]of longint;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
procedure buildtree(l,r,p:longint);
var
	k:longint;
begin
	if (l=r) then begin fm[p]:=a[l];fn[p]:=a[l];exit;end;
	k:=(l+r)shr 1;
	buildtree(l,k,p shl 1);
	buildtree(k+1,r,p shl 1+1);
	fm[p]:=max(fm[p shl 1],fm[p shl 1+1]);
	fn[p]:=min(fn[p shl 1],fn[p shl 1+1]);
end;
procedure ask(a,b,l,r,p:longint;var low,high:longint);
var
	k,tl,th:longint;
begin
	if (a=l)and(b=r) then begin low:=fn[p];high:=fm[p];exit;end;
	k:=(a+b) shr 1;
	if (r<=k) then begin ask(a,k,l,r,p shl 1,low,high);exit;end;
	if (l>k) then begin ask(k+1,b,l,r,p shl 1+1,low,high);exit;end;
	ask(a,k,l,k,p shl 1,low,high);tl:=low;th:=high;
	ask(k+1,b,k+1,r,p shl 1+1,low,high);
	low:=min(low,tl);high:=max(high,th);
end;
begin
	assign(input,'window.in');reset(input);assign(output,'window.out');rewrite(output);
	readln(n,k);
	for i:=1 to n do read(a[i]);
	buildtree(1,n,1);
	for i:=1 to n-k+1 do
		begin
			ask(1,n,i,i+k-1,1,low,high);//a-min;b:max
			ansa[i]:=low;ansb[i]:=high;
        end;
	for i:=1 to n-k do write(ansa[i],' ');writeln(ansa[n-k+1]);
	for i:=1 to n-k do write(ansb[i],' ');writeln(ansb[n-k+1]);
	close(output);
end.

