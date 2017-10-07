var
	a:array[0..64]of longint;
	i,j,k,l,n:longint;
	c:longint;
	ans:int64;
	s:string;
	co:array[0..4]of longint;
function check(i,j:longint):boolean;
var
	u,k:longint;
begin
	if i-2<1 then u:=1 else u:=i-2;
	fillchar(co,sizeof(co),0);
	for k:=u to i do
		begin
		if a[k]=j then
			inc(co[j]);
		if co[j]>=2 then exit(false);
		end;
	exit(true);
end;
function ok :boolean;
var
	i:longint;
begin
	fillchar(co,sizeof (co),0);
	if n-2>0 then
		begin
		if (a[1]=a[n])and(a[2]=a[n])and(n>2)then exit(false);
        if (a[n-1]=a[n-2])and(a[n-1]=a[n])and(n>2)then exit(false);
		if (a[n]=a[n-1])and(a[n-1]=a[1])and(n>2)then exit(false);
        end;
	exit(true);
end;
procedure dfs(i:longint);
var
	j,t:longint;
	bol:boolean;
begin
	if (i>n)then
	begin
		bol:=ok;
		if bol then
			inc(ans);
		exit;
	end;
	for j:=1 to 4 do
		begin
			if check(i,j) then
				begin
					a[i]:=j;a[i+n]:=j;
					dfs(i+1);
				end;
		end;
	a[i]:=0;
	a[i+n]:=0;
end;
begin
	//assign(input,'b.in');reset(input);
	//assign(output,'b.out');rewrite(output);
	readln(n);
	dfs(1);
	writeln(ans);
	//close(input);
	//close(output);
end.
