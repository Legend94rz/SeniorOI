var
	tl,tr,i,j,n,m,ansl,ansr:longint;
	s,a:array[0..100001]of int64;
	f:array[0..400001]of longint;
	l,r,mid:longint;
	ans:int64;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
procedure buildtree(l,r,p:longint);
var
	k:longint;
begin
	if l=r then begin f[p]:=a[l];exit;end;
	k:=(l+r)shr 1;
	buildtree(l,k,p shl 1);
	buildtree(k+1,r,p shl 1+1);
	f[p]:=min(f[p shl 1],f[p shl 1+1]);
end;
function ask(a,b,l,r,p:longint):longint;
var
	k:longint;
begin
	if (a=l)and(b=r) then exit(f[p]);
	k:=(a+b) shr 1;
	if r<=k then exit(ask(a,k,l,r,p shl 1));
	if l>k then exit(ask(k+1,b,l,r,p shl 1+1));
	EXIT(min(ask(a,k,l,k,p shl 1),ask(k+1,b,K+1,r,p shl 1+1)));
end;
begin
	assign(input,'good.in');reset(input);assign(output,'good.out');rewrite(output);
	readln(n);
	for i:=1 to n do begin read(a[i]);s[i]:=s[i-1]+a[i];end;
	buildtree(1,n,1);
	for i:=1 to n do
		begin
			l:=1;r:=i;
			repeat
				mid:=(l+r)shr 1;
				if ask(1,n,mid,i,1)<a[i] then
					L:=mid+1
				else
					r:=mid-1;
			until l>r;
			tl:=l;
			l:=i;r:=n;
			repeat
				mid:=(l+r) shr 1;
				if ask(1,n,i,mid,1)<a[i] then
					r:=mid-1
				else
					l:=mid+1;
			until L>r;
			tr:=r;
			if (s[tr]-s[tl-1])*a[i]>ans then begin ans:=(s[tr]-s[tl-1])*a[i];ansl:=tl;ansr:=tr;end;
        end;
	writeln(ans);
	writeln(ansl,' ',ansr);
	close(output);
end.

