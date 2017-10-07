var
   i,j,n,m,x,y:longint;
   a:array[0..100005]of longint;
   f,w:array[0..5000000]of longint;
function max(a,b:longint):longint;
begin
        if a>b then exit(a);
        exit(b);
end;
function ask(a,b,l,r,p:longint):longint;
var
   k,t1,t2:longint;
begin
     if (l=a)and(b=r) then exit(p);
     k:=(a+b)shr 1;
     if k<l then exit(ask(k+1,b,l,r,2*p+1));
     if k>=r then exit(ask(a,k,l,r,2*p));
     t1:=ask(a,k,l,k,2*p);t2:=ask(k+1,b,k+1,r,2*p+1);
     if f[t1]>f[t2] then
     	exit(t1);
     exit(t2);
end;
procedure buildtree(l,r,p:longint);
begin
     if l=r then begin f[p]:=a[l];w[p]:=l;exit;end;
     buildtree(l,(l+r)shr 1,2*p);
     buildtree((l+r)shr 1+1,r,2*p+1);
     f[p]:=max(f[2*p],f[2*p+1]);
     if f[2*p]>f[2*p+1] then
     	 w[p]:=w[2*p]
     else
     	 w[p]:=w[2*p+1];
end;
begin
     assign(input,'depressedx.in');reset(input);assign(output,'depressedx.out');rewrite(output);
     readln(n);
     for i:=1 to n do
     	 read(a[i]);
     buildtree(1,n,1);
     readln(m);
     for i:=1 to m do
          begin
	       readln(x,y);
               writeln(w[ask(1,n,x,y,1)]);
	  end;
     close(input);close(output);
end.
