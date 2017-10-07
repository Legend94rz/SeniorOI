var
	a:array[0..22]of longint;
	i,j,k,n,ans,sm,c:longint;
	b:array[0..22]of boolean;
	str:string;
	l,r:longint;
	qu:array[0..2000]of string;
function ispr(x:longint):boolean;
var
	j:longint;
begin
	if x<2 then exit(false);
	if x=2 then exit(true);
	for j:=2 to trunc(sqrt(x)) do
		if(x mod j =0)then exit(false);
	exit(true);
end;
function dupe(st:string):boolean;
var
	j:longint;
begin
	//writeln(r);
	for j:=0 to r-1 do
		if (qu[j]=st) then
			exit(true);
	exit(false);
end;
procedure dfs(s:longint);
var
	i,q,j:longint;
begin
	for i:=s to n-k+s do
		if (not b[i])and(i<=n) then
		begin
			b[i]:=true;
			inc(c);
			if c=k then
				begin
					for q:=1 to n do
						if b[q] then
							begin
							sm:=sm+a[q];
							str:=str+chr(ord('0')+q);
							end;
					inc(r);qu[r]:=str;
					if ispr(sm)and(not dupe(str)) then
						inc(ans);
					sm:=0;
					str:='';
					b[i]:=false;
					dec(c);
					continue;
				end;
			dfs(s+1);
			b[i]:=false;
			dec(c);
		end;
end;
begin
	assign(input,'select.in');assign(output,'select.out');reset(input);rewrite(output);
	readln(n,k);
	fillchar(b,sizeof(b),0);
	for i:=1 to n do
		read(a[i]);
	sm:=0;
	dfs(1);
	writeln(ans);
	close(input);close(output);
end.
