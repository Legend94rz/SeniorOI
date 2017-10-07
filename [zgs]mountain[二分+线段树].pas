var
	i,j,n,m,kmax,kmin:longint;
	f,g:array[0..400001]of longint;
	x,d:array[0..100001]of longint;
	l,r,mid,ans:longint;
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
procedure buildtree(l,r,p:longint);
var
	k:longint;
begin
	if(l=r) then begin f[p]:=d[l];g[p]:=d[l];exit;end;
	k:=(l+r) shr 1;
	buildtree(l,k,p shl 1);
	buildtree(k+1,r,p shl 1+1);
	f[p]:=max(f[p shl 1],f[p shl 1+1]);
	g[p]:=min(g[p shl 1],g[p shl 1+1]);
end;
procedure ask(a,b,l,r,p:longint;var kmin,kmax:longint);
var
	k,t1,t2:longint;
begin
	if (a=l)and(b=r) then begin kmax:=max(kmax,f[p]);kmin:=min(g[p],kmin);exit;end;
	k:=(a+b) shr 1;
	if r<=k then begin ask(a,k,l,r,p shl 1,kmin,kmax);exit;end;
	if L>k then begin ask(k+1,b,l,r,p shl 1+1,kmin,kmax);exit;end;
	t1:=1 shl 30;t2:=0;
	ask(a,k,l,k,p shl 1,t1,t2);
    ask(k+1,b,k+1,r,p shl 1+1,kmin,kmax);
	kmin:=min(kmin,t1);kmax:=max(kmax,t2);
end;
procedure qsort(s,t:longint);
var
	i,j,k,u:longint;
begin
	i:=s;j:=t;k:=x[(s+t) shr 1];
	repeat
		while (x[j]>k) do dec(j);
		while (x[i]<k) do inc(I);
		if i<=j then begin
			u:=x[i];x[i]:=x[j];x[j]:=u;
			u:=d[i];d[i]:=d[j];d[j]:=u;
			inc(i);dec(j);
        end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
begin
	assign(input,'mountain.in');reset(input);assign(output,'mountain.out');rewrite(output);
	readln(n,m);
	for i:=1 to n do readln(x[i],d[i]);
	qsort(1,n);
	//for i:=1 to n do writeln(x[i],' ',d[i]);
    buildtree(1,n,1);ans:=1 shl 30;
	for i:=1 to n-1 do
		begin
			l:=i;r:=n;
			repeat
				mid:=(l+r)shr 1;
				kmin:=1 shl 30;kmax:=0;
				//write(i,' ask ',l,' ',mid);
                ask(1,n,l,mid,1,kmin,kmax);
                //writeln('-',kmin,' ',kmax);
				if (abs(kmin-d[i])>=m)or(abs(kmax-d[i])>=m) then
					r:=mid
				else
					l:=mid+1;
            until l>=r;
			if (x[l]-x[i]<ans)and(l<=n)and(abs(d[l]-d[i])>=m) then begin {write(i,' >>> ',l,' Up ',ans,' To ');}ans:=x[l]-x[i];{writeln(ans);}end;
		end;
	if ans<>1 shl 30 then writeln(ans) else writeln(-1);
	close(output);
end.

