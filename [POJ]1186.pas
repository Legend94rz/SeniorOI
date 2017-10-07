const
	bg=3711177;
var
	m,n,i,j,ans:longint;
	k,p:array[0..30]of longint;
	ht,num:array[-6000000..6000000]of longint;
	flag:array[-8000000..bg+10]of boolean;
function mi(a,b:longint):longint;
var
	s:longint;
begin
	s:=1;
	while b>0 do
		begin
			if b and 1=1 then s:=s*a;
			a:=a*a;
			b:=b shr 1;
		end;
	exit(s);
end;
function hash(key:longint):longint;
var
	k:longint;
begin
	k:=key mod bg;
	while (flag[k])and(ht[k]<>key) do
		begin
			inc(K);
			if k>=bg then
				exit(bg);
		end;
	exit(k);
end;
procedure insert(x:longint);
var
	k:longint;
begin
	k:=hash(x);inc(num[k]);
	if not flag[k] then
		begin
			ht[k]:=x;
			flag[k]:=true;
		end;
end;
procedure dfs(i,sum,ct:Longint);
var
	j,t:Longint;
begin
	if (i>n div 2)and(ct=1)or(ct=2)and(i>n) then exit;
	for j:=1 to m do
		begin
			t:=sum+k[i]*mi(j,p[i]);
			if (i=n)and(ct=2) then begin {writeln('INC!!!');}inc(ans,num[hash(-t)]);end;
			//t:=sum+k[i]*mi(j,p[i]);
			if (i=n div 2)and(ct=1) then insert(t);
			dfs(i+1,sum+k[i]*mi(j,p[i]),ct);
		end;
end;
begin
	readln(n);
	readln(m);
	for i:=1 to n do
		readln(k[i],p[i]);
	dfs(1,0,1);
	dfs(n div 2+1,0,2);
	{for i:=1 to n do
		begin
			read(j);
			insert(j);
	end;
	for i:=1 to m do
	begin
		read(j);
		 writelN(j,' ',num[hash(-j)]);
	end;}
	writeln(ans);
end.
