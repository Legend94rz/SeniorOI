const
	p=11129;
var
	i,j,n,m,tot,ans:longint;
	f:array[0..100001]of longint;
	next,head,ed:array[0..100001]of longint;
	ind,oud:array[0..100001]of longint;
	q:array[0..100001]of longint;
	l,r:longint;
	x,y:longint;
procedure add(x,y:longint);
begin
	inc(tot);
	inc(ind[y]);inc(oud[x]);
	ed[tot]:=y;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure topdp;
var
	ege,k,b:longint;
begin
	repeat
		inc(l);if l>=100000 then l:=1;
		k:=q[l];
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				dec(ind[b]);
				if ind[b]=0 then
					begin
						inc(r);if r>=100000 then r:=1;
						q[r]:=b;
					end;
				f[b]:=(f[k]+f[b])mod p;
				ege:=next[ege];
			end;
	until l=r;
	for i:=1 to n do
		if oud[i]=0 then
			ans:=(ans+f[i])mod p;
	writeln(ans);
end;
begin
	readln(n,m);
	for i:=1 to m do
		begin
			readln(x,y);
			add(x,y);
		end;
	for i:=1 to n do
		if ind[i]=0 then
			begin
				inc(r);
				q[r]:=i;
				f[i]:=1;
			end;
	topdp;
end.

