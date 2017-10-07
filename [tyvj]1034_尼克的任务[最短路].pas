var
    i,j,n,k,s,t     :longint;
    next,head,ed,e,d:array[0..100001]of longint;
    tot,ans         :Longint;
procedure add(x,y,z:Longint);
begin
    inc(tot);
    ed[tot]:=y;
    e[tot]:=z;
    next[tot]:=head[x];
    head[x]:=tot;
end;
procedure spfa;
var
    l,r,ege,b,k :longint;
    q           :array[0..100001]of longint;
    vis         :array[0..100001]of boolean;
begin
    fillchar(d,sizeof(d),$3f);d[1]:=0;
    fillchar(vis,sizeof(vis),0);vis[1]:=true;
    l:=0;r:=1;q[1]:=1;
    repeat
        inc(l);if l>=100000 then L:=1;
        k:=q[l];vis[k]:=false;
        ege:=head[k];
        while ege<>0 do
            begin
                b:=ed[ege];
                if d[k]+e[ege]<d[b] then
                    begin
                        d[b]:=d[k]+e[ege];
                        if not vis[b] then
                            begin
                                inc(r);if r>=100000 then r:=1;
                                q[r]:=b;
                                vis[b]:=true;
                            end;
                    end;
                ege:=next[ege];
            end;
    until l=r;
end;
begin
    readln(n,k);
    for i:=1 to k do
        begin
            readln(s,t);
            add(s,s+t,t);
        end;
    for I:=1 to n do
        if head[i]=0 then
            add(i,i+1,0);
    spfa;
    writeln(n-d[n+1]);
end.
