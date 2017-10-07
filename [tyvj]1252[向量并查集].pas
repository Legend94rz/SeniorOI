const
	p=20003;
var
	f,d:array[0..20010]of longint;
	tx,ty,i,j,n,m,x,y,k:longint;
	z:string;
	ht:array[0..20010]of longint;
function find(x:longint):longint;
var
	tx:longint;
begin
	if f[x]=x then exit(x);
	tx:=find(f[x]);
	d[x]:=(d[f[x]]+d[x])mod 2;
	f[x]:=tx;
	exit(f[x]);
end;
function hash(key:longint):longint;
begin
	hash:=key mod p;
	while (ht[hash]<>-1)and(ht[hash]<>key) do
		begin
			inc(hash);
			if hash>20000 then hash:=0;
		end;
	ht[hash]:=key;
	exit(hash);
end;
begin
	readln(n,m);
	for i:=1 to 20000 do
		f[i]:=i;
	fillchar(ht,sizeof(ht),$FF);
	for i:=1 to m do
		begin
			readln(x,y,z);
			delete(z,1,1);dec(x);
			if z='even' then k:=0 else k:=1;
			x:=hash(x);y:=hash(y);
			tx:=find(x);ty:=find(y);
			if tx<>ty then
				begin
					f[ty]:=tx;
					d[ty]:=(d[x]+k+2-d[y]) mod 2;
				end
			else
				if (2-d[x]+d[y])mod 2<>k then
					begin
						writeln(i-1);
						exit;
					end;
		end;
	writeln(m);
end.

