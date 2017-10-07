{
此题第一反应是维护最大、最小值，但是最小值可以正向维护，
而最大值无法正向维护，就要用两遍SPFA；
再考虑，维护最大值与最小值的差，
这是可以正向维护的，因此可以一遍SPFA解之~
}
var
	tot,i,j,n,m,x,y,z:longint;
	low,high,d,a:array[0..100001]of longint;
	head,ed,e,next:array[0..1000001]of longint;
procedure add(x,y:longint);
begin
	inc(tot);
	ed[tot]:=y;
	next[tot]:=head[x];
	head[x]:=tot;
end;
function max(a,b,c:longint):longint;
begin
	max:=a;
	if max<b then max:=b;
	if max<c then max:=c;
end;
function min(a,b,c:longint):longint;
begin
	min:=a;
	if min>b then min:=b;
	if min>c then min:=c;
end;
procedure spfa;
var
	i:longint;
	k,b,ege:longint;
	v:array[0..100001]of boolean;
	q:array[0..150001]of longint;
	l,r,t:longint;
	flag:boolean;
begin
	l:=0;r:=1;q[r]:=1;
	fillchar(v,sizeof(v),0);v[1]:=true;
	fillchar(low,sizeof(low),$3F);low[1]:=a[1];
	repeat
		inc(l);if l>=150000 then l:=1;
		k:=q[l];v[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];flag:=false;
				t:=low[b];low[b]:=min(low[b],low[k],a[b]);
				if low[b]<>t then flag:=true;

				t:=d[b];d[b]:=max(d[b],a[b]-low[k],d[k]);
				if d[b]<>t then flag:=true;
				if flag and (not v[b]) then
					begin
						inc(r);if r>=150000 then r:=1;
						q[r]:=b;v[b]:=true;
					end;
                ege:=next[ege];
            end;
	until l=r;
	writeln(d[n]);
end;
begin
	readln(n,m);
	for i:=1 to n do read(a[i]);
	for i:=1 to m do
		begin
			readln(x,y,z);
			add(x,y);
			if z=2 then add(y,x);
		end;
	spfa;
end.

