var
    i,j,n,m,t,count,mst,p:longint;
    num,time:longint;
    x,y,z,tot:Longint;
    ed,head,next,st:array[0..1500001]of longint;
    a,b,e,rea,low,lab,f:array[0..500001]of longint;
    v:array[0..10001]of byte;
function min(a,b:longint):longint;
begin
    if a<b then exit(a);
    exit(b);
end;
procedure dfs(x:longint);
var
    k,b,ege:longint;
begin
    v[x]:=1;
    inc(time);rea[x]:=time;low[x]:=time;
    inc(p);st[p]:=x;
    ege:=head[x];
    while ege<>0 do
        begin
            b:=ed[ege];
            if v[b]=0 then dfs(b);
            if v[b]=1 then low[x]:=min(low[x],low[b]);
            ege:=next[ege];
        end;
    if rea[x]=low[x] then
        begin
            inc(num);
            while st[p+1]<>x do
                begin
                    lab[st[p]]:=num;
                    v[st[p]]:=2;
                    dec(p);
                end;
        end;
end;
function getf(x:longint):longint;
var
    c,t:longint;
begin
    t:=x;
    while f[x]<>x do x:=f[x];
    while f[t]<>x do
        begin
            c:=f[t];
            f[t]:=x;
            t:=c;
        end;
    exit(x);
end;
procedure add(x,y:Longint);
begin
    inc(tot);
    ed[tot]:=y;
    next[tot]:=head[x];
    head[x]:=tot;
end;
procedure qsort(s,t:longint);
var
    i,j,k,u:longint;
begin
    i:=s;j:=t;k:=e[(s+t) shr 1];
    repeat
        while e[j]>k do dec(j);
        while e[i]<k do inc(i);
        if i<=j then
            begin
                u:=e[i];e[i]:=e[j];e[j]:=u;
                u:=a[i];a[i]:=a[j];a[j]:=u;
                u:=b[i];b[i]:=b[j];b[j]:=u;
                inc(i);dec(j);
            end;
    until i>j;
    if (s<j) then qsort(s,j);
    if (i<t) then qsort(i,t);
end;
begin
    readln(n,m,t);
    for i:=1 to m do
        begin
            readln(x,y);
            add(x,y);
        end;
    for i:=1 to n do
        if v[i]=0 then
            dfs(i);
    //writeln(num);
    for i:=1 to t do
        begin
            readln(x,y,z);
            a[i]:=lab[x];b[i]:=lab[y];e[i]:=z;
        end;
    qsort(1,t);
    for i:=1 to num do f[i]:=i;
    for I:=1 to t do
        begin
            x:=getf(a[i]);y:=getf(b[i]);
            if x<>y then
                begin
                    f[x]:=y;inc(count);
                    mst:=mst+e[i];
                end;
        end;
    if count=num-1 then
        writeln(mst)
    else
        writeln('Impossible');
end.
