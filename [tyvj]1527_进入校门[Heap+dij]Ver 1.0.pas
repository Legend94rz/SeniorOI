var
	i,j,n,m,x,y,z,k,nn,tot:longint;
	dx:array[1..4]of longint=(1,0,-1,0);
	dy:array[1..4]of longint=(0,-1,0,1);
	d,hp,head,ed,e,next:array[0..4000001]of longint;
	tp:array[0..1000001]of longint;
	l:longint;
{
---Heap_Node---
d[i]	:堆中的i号结点的最短路
hp[i]	:堆中i号点在图中的编号是多少
---Heap_Node---
tp[i]	:图中i号点在堆中的编号是多少
}
procedure swap(x,y:longint);//Warnning
var
	t:longint;
begin
    tp[hp[x]]:=y;tp[hp[y]]:=x;
    t:=hp[x];hp[x]:=hp[y];hp[y]:=t;
	t:=d[x];d[x]:=d[y];d[y]:=t;
end;
procedure up(x:longint);
var
	i:longint;
begin
	while (x>1)and(d[x shr 1]>d[x]) do begin swap(x,x shr 1);x:=x shr 1;end;//Warnning!
end;
procedure del;//Warnning
var
	i,j:longint;
begin
	swap(1,l);dec(l);
	j:=2;
	while (j<=l) do
		begin
            if (d[j]>d[j+1])and(j<l) then inc(j);
			if d[j]<d[j shr 1] then
				begin
					swap(j,j shr 1);
					j:=j shl 1;
				end
			else
				break;
        end;
end;
procedure dij;
var
	i,j:longint;
	k,b,ege,min:longint;
begin
    fillchar(d,sizeof(d),$3f);d[1]:=0;l:=nn;
	for i:=1 to nn do begin hp[i]:=i;tp[i]:=i;end;
	for i:=1 to nn-1 do
		begin
			k:=hp[1];
			ege:=head[k];
			while ege<>0 do
				begin
					b:=ed[ege];
					if d[1]+e[ege]<d[tp[b]] then
						begin
							d[tp[b]]:=e[ege]+d[1];
							up(tp[b]);
                        end;
					ege:=next[ege];
                end;
			del;
        end;
end;
procedure add(x,y,z:longint);
begin
	inc(tot);
	//writeln(x,'->',y,' ',z);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
begin
	readln(n,m);nn:=n*m;
	for i:=1 to n do
		for j:=1 to m do
			begin
				read(z);
				x:=(i-1)*m+j;
				for k:=1 to 4 do
					if (i+dx[k]>=1)and(i+dx[k]<=n)and(j+dy[k]>=1)and(j+dy[k]<=m) then//Warnning
						begin
							y:=(i+dx[k]-1)*m+j+dy[k];//Warnning!
							add(x,y,z);
                        end;
            end;

	dij;
	writeln(d[tp[nn]]+z);//Warnning
end.

