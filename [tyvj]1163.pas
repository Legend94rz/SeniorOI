program ty1163;
var
	next,head,e,ed:array[-1..20005]of longint;
	i,j,n,p,kk:longint;
	a:array[-1..10005]of longint;
	x,y,z,tot:longint;
	min,max,mid,me:longint;
	f:boolean;
	d:array[-1..1005]of longint;
procedure qsort(s,t:longint);
var
	i,j,k,y:longint;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1];
	repeat
		while a[j]>k do dec(j);
		while a[i]<k do inc(i);
		if i<=j then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				inc(i);dec(j);
			End;
	Until i>=j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
function ju(key:longint):byte;
begin
	if key>me  then exit(1);
	exit(0);
End;
procedure spfa;
var
	vis:array[-1..1005]of boolean;
	q:array[-1..1505]of longint;
	l,r:longint;

	ege,k,b:longint;
begin
	fillchar(d,sizeof(d),$3f);l:=0;r:=1;q[r]:=1;
	d[1]:=0;fillchar(vis,sizeof(vis),0);vis[1]:=true;
	repeat
		inc(l);
		if l>=1500 then l:=1;
		k:=q[l];
		ege:=head[k];
		vis[k]:=false;
		while ege<>0 do
			begin
				b:=ed[ege];
				if d[k]+ju(e[ege])<d[b] then
					begin
						d[b]:=d[k]+ju(e[ege]);
						if not vis[b] then
							begin
								inc(r);
								if r>=1500 then r:=1;
								q[r]:=b;
								vis[b]:=true;
							end;
					end;
				ege:=next[ege];
			End;
	Until l=r;
end;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;
	e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
begin
	readln(n,p,kk);
	for i:=1 to p do
		begin
			readln(x,y,z);
			add(x,y,z);add(y,x,z);
			a[i]:=z;
		End;
        inc(p);a[p]:=0;
	qsort(1,p);
	min:=1;max:=p;
	repeat
		mid:=(min+max)shr 1;
		me:=a[mid];
		spfa;
		if d[n]<=kk then
			max:=mid-1
		else
			min:=mid+1;
		f:=f or (d[n]<=kk);
	Until min>max;
	if (not f) then
		writeln(-1)
	else
		writeln(a[min]);
end.

