var
	i,j,n,m,tot,x,ans:Longint;
	f:array[0..1,0..505001]of longint;
	v:array[0..600001]of boolean;
	head,ed,next:array[0..3000001]of longint;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
procedure dfs(x:longint);
var
	i:longint;
	k,b,ege:longint;
begin
	v[x]:=true;
	ege:=head[x];
	while ege<>0 do
		begin
			b:=ed[ege];
			if not v[b] then begin
				dfs(b);
				inc(f[0,x],f[1,b]);
				inc(f[1,x],min(f[0,b],f[1,b]));
			end;
			ege:=next[ege];
		end;
	//if x=2 then writeln('Pre:',f[1,x]);
	f[1,x]:=f[1,x]+1;
end;
procedure add(x,y:longint);
begin
	inc(tot);
	ed[tot]:=y;
	next[tot]:=head[x];
	head[x]:=tot;
end;
begin
	readln(n);
	if n=1 then begin writeln(0);exit;end;
	for i:=1 to n do
		while true do
			begin
				read(x);
				if x=0 then break;
				add(i,x);
			end;
	for i:=1 to n do
		if not v[i] then
			begin
				dfs(i);
				ans:=ans+min(f[0,i],f[1,i]);
			end;
	//writeln('>>',f[0,2],' ',f[1,2]);
	//writeln(min(f[0,1],f[1,1])-1);
	writeln(ans-1);
end.

