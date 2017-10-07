var
	i,j,n,M,p,t,v,key,x,y,t1,t2,k,g:longint;
	mst:int64;
	a,b,e:array[0..1000001]of longint;
	time:array[0..301,0..301,0..51]of boolean;
	f,fa:array[0..10001]of longint;
function getf(x:longint):longint;
var
	c,t:longint;
begin
	t:=x;
	while fa[x]<>x do x:=fa[x];
	while fa[t]<>x do
		begin
			c:=fa[t];
			fa[t]:=x;
			t:=c;
        end;
	exit(x);
end;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
procedure qsort(s,t:longint);
var
	i,j,k,u:longint;
begin
	i:=s;j:=t;k:=e[(s+t)shr 1];
	repeat
		while e[j]>k do dec(j);
		while e[i]<k do inc(i);
		if i<=j then
			begin
				u:=e[i];e[i]:=e[j];e[j]:=u;
				u:=a[i];a[i]:=a[j];a[j]:=u;
				u:=b[i];b[i]:=b[j];b[j]:=u;
				inc(i);dec(J);
            end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
function check(ege,st,ed:longint):boolean;
var
	i:longint;
begin
	for i:=st to ed do
		if not time[a[ege],b[ege],i] then
			exit(false);
	exit(true);
end;
function kruscal(st,ed:longint):longint;
var i,j,tot,x,y:longint;
begin
    for i:=1 to n do fa[i]:=i;
    tot:=0;kruscal:=0;
    for i:=1 to m do
          if check(i,st,ed) then
          begin
                 x:=getf(a[i]) ;y:=getf(b[i]) ;
                 if x<>y then
                 begin
                          inc(tot);
                          inc(kruscal,e[i]);
                          fa[x]:=y;
                 end;
                 if tot =n-1 then break;
          end;
    if tot =n-1 then exit(kruscal);
    exit(-1);
end;
begin
	readln(N,M,T,V,Key);
	for i:=1 to m do begin readln(a[i],b[i],e[i]);e[i]:=e[i]*V;end;
	fillchar(time,sizeof(time),1);
	readln(p);
	for i:=1 to p do//一条边可能有多个
		begin
	        readln(x,y,t1,t2);
			for k:=t1 to t2 do
				begin
					time[x,y,k]:=false;time[y,x,k]:=false;
                end;
		end;qsort(1,m);
	FILLchar(f,sizeof(f),$3f);f[0]:=0;
	for i:=1 to t do
		for j:=0 to i-1 do
			begin
                mst:=0;g:=0;
				for k:=1 to n do fa[k]:=k;
				for k:=1 to m do
					if check(k,j+1,i) then
	                    begin
							x:=getf(a[k]);y:=getf(b[k]);
							if x<>y then
								begin
									inc(mst,e[k]);inc(g);
									fa[x]:=y;
                                end;
						end;
				if g=n-1 then f[i]:=min(f[i],f[j]+mst*(i-j)+key);
			end;
	writeln(f[t]);
end.

