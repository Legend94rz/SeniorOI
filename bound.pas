type
	re=record
		zhi,weiz:longint;
		end;
var
	i,j,n,p,x,y,t,m:longint;
	dis,al,ar,aa,tl,tr:longint;
	a:array[0..100001]of longint;
	s,r:array[0..100001]of longint;
	flag:boolean;
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
procedure qsort(ss,t:longint);
var
	i,j,u,k,k2:longint;
begin
	i:=ss;j:=t;k:=s[(ss+t)shr 1];k2:=r[(ss+t)shr 1];
	repeat
		while (s[j]>k)or((s[j]=k)and(r[j]>k2)) do dec(j);
		while (s[i]<k)or((s[i]=k)and(r[i]<k2)) do inc(i);
		if i<=j then
			begin
				u:=s[i];s[i]:=s[j];s[j]:=u;
				u:=r[i];r[i]:=r[j];r[j]:=u;
				inc(i);dec(j);
			end;
	until i>j;
	if (ss<j) then qsort(ss,j);
	if (i<t) then qsort(i,t);
end;
procedure judge(k,x,y:longint);//k:×îÓÅÖµ
var
	l,rr:longint;
begin
	l:=min(r[x],r[y])+1;rr:=max(r[x],r[y]);
	if abs(p-k)<dis then
		begin
			dis:=abs(p-k);aa:=k;al:=l;ar:=rr;
		end
	else
		if abs(p-k)=dis then
			if (l<al)or(l=al)and(rr<ar) then
				begin
					al:=l;ar:=rr;aa:=k;
				end;
end;
procedure work(p:longint);
begin

end;
begin
	assign(input,'bound.in');reset(input);assign(output,'bound.out');rewrite(output);
	readln(n,m);
	for i:=1 to n do
		begin
		    read(a[i]);
			s[i]:=s[i-1]+a[i];
			r[i]:=i;
		end;
	qsort(1,n);
	for i:=1 to m do
		begin
			readln(p);x:=1;dis:=maxlongint;
			for y:=1 to n do judge(abs(s[y]),0,y);
			y:=2;
			while (y<=n)and(x<=n) do
				begin
					t:=s[y]-s[x];
					judge(t,x,y);
					if (t<p) then inc(y) else inc(x);
					if x=y then inc(y);
				end;
			writeln(aa,' ',al,' ',ar);
        end;
	close(output);
end.

