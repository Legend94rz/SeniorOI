var
	i,j,n,m,tot,x,y,z:longint;
	l,r,mid:longint;
	ed,e,next,head:array[0..1000001]of longint;
	a:array[0..10001]of longint;
function max(a,b:Longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
function bfs(key:longint):boolean;
var
	q:array[0..100001]of longint;
	have:array[0..100001]of longint;
	V:array[0..10001]of boolean;
	l,r,tmp,i:longint;
	k,b,ege:longint;
begin
	l:=0;r:=1;q[r]:=1;
    fillchar(v,sizeof(v),0);v[1]:=true;
    fillchar(have,sizeof(have),$3f);have[1]:=a[1];
	repeat
		inc(l);if l>=100000 then l:=1;
		k:=q[l];v[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				tmp:=max(have[k]-e[ege],0);
				if tmp+a[b]<have[b] then
					begin
						have[b]:=tmp+a[b];
						if (not v[b])and(have[b]<=key) then
							begin
								inc(r);if r>=100000 then r:=1;
								q[r]:=b;v[b]:=true;
							end;
					end;
				ege:=next[ege];
            end;
	until l=r;
	if have[n]<=key then exit(true);
	exit(false);
end;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
begin
//	assign(input,'2.in');reset(input);
	readln(n,m);
	for I:=1 to n do read(a[i]);
	for i:=1 to m do
		begin
			readln(x,y,z);
			add(x,y,z);
		end;
	l:=a[1];r:=$3f3f3f3f;
	repeat
		mid:=(l+r)shr 1;
		if bfs(mid) then
			r:=mid-1
		else
			l:=mid+1;
	until l>r;
	writeln(l);
end.

