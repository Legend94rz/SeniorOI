const p=2147483647;
var
	i,j,n,m,tot,x,y,z,t:longint;
	d,num,L:array[0..1001]of int64;
	know:array[0..1001]of boolean;
	a:array[0..1001,0..1001]of longint;
	ans:int64;
	head,ed,e,next:array[0..1000001]of longint;
procedure add(x,y,z:Longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure dij;
var
	i,j,k,b,ege,mind:longint;
begin
	fillchar(d,sizeof(d),$3f);d[1]:=0;
	num[1]:=1;
	k:=1;
	while true do
		begin
			know[k]:=true;
			ege:=head[k];
			while ege<>0 do
				begin
					b:=ed[ege];
					if d[k]+e[ege]<d[b] then
						d[b]:=d[k]+e[ege];
					ege:=next[ege];
                end;
			mind:=$3f3f3f3f;
			for i:=1 to n do
				if (not know[i])and(d[i]<mind) then
					begin
						k:=i;
						mind:=d[i];
					end;
			if mind=$3f3f3f3f then break;
        end;
end;
procedure qsort(s,t:Longint);
var
	i,j,k,u:longint;
begin
	i:=s;j:=t;k:=d[(s+t)shr 1];
	repeat
		while d[j]>k do dec(j);
		while d[i]<k do inc(i);
		if i<=j then
			begin
				u:=d[i];d[i]:=d[j];d[j]:=u;
				u:=l[i];l[i]:=l[j];l[j]:=u;
				inc(i);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
begin
	readln(n,m);
	fillchar(a,sizeof(a),$3f);
	for i:=1 to m do
		begin
			readln(x,y,z);
			if z<a[x,y] then begin a[x,y]:=z;a[y,x]:=z;end;
			add(x,y,z);add(y,x,z);
		end;
	dij;
	for i:=1 to n do l[i]:=i;
	qsort(1,n);
    for i:=2 to n do
		begin
			t:=0;
			for j:=1 to i-1 do
				if d[j]+a[l[j],l[i]]=d[i] then inc(t);
			ans:=(ans*t)mod p;
		end;
	writeln(ans);
end.

