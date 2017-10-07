var
   a:array[1..1000,1..3]of integer; //1 - 总分;2 - 数学;3 - 语文;
   n,i:integer;
function isbig(a,b,c,x,y,z:longint):boolean;
begin
     if(a>x)then exit(true);
     if(a<x)then exit(false);
     if(b>y)then exit(true);
     if(b<y)then exit(false);
     if(c>z)then exit(true);
     if(c<z)then exit(false);
     exit(false);
end;
procedure qsort(s,t:longint);
var
   i,j,temp,k1,k2,k3,y:longint;
begin
     temp:=random(t-s+1)+s;
     k1:=a[temp,1];k2:=a[temp,2];k3:=a[temp,3];
     i:=s;j:=t;
     repeat
           while not (Isbig(a[i,1],a[i,2],a[i,3],k1,k2,k3)) do inc(i);
           while (Isbig(a[j,1],a[j,2],a[j,3],k1,k2,k3)) do dec(j);
           if(i<=j)then
                begin
                    y:=a[i,1];a[i,1]:=a[j,1];a[j,1]:=y;
                    y:=a[i,2];a[i,2]:=a[j,2];a[j,2]:=y;
                    y:=a[i,3];a[i,3]:=a[j,3];a[j,3]:=y;
                    inc(i);dec(j);
                end;
     until i>=j;
     //inc(i);dec(j);
     if(i<t)then qsort(i,t);
     if(s<j)then qsort(s,j);
end;
begin
    readln(n);
    for i:=1 to n do
        readln(a[i,1],a[i,2],a[i,3]);
    qsort(1,n);
    for i:=1 to n  do
        begin
        write(a[i,1],' ',a[i,2],' ',a[i,3]);
        writelN;
        end;
    readln;
end.

