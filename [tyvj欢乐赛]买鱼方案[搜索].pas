var
	i,j,n,m:longint;
	flag:array[0..31,0..31]of boolean;
	v:array[0..1001]of boolean;
	l,cost,ans:longint;
	s,t,a,ta:array[0..31]of longint;
	x,y:longint;
function check(x:longint):boolean;
var
	i:longint;
begin
	for i:=1 to l do
		if flag[a[i],s[x]] then
			exit(false);
	exit(true);
end;
procedure dfs(x,sum:longint);
var
	i:longint;
begin
	if x=n+1 then
		begin
			if l>ans then begin ans:=l;cost:=sum;ta:=a;end
			else if(l=ans)and(sum>cost) then
				begin
					ta:=a;cost:=sum;
				end;
			exit;
        end;
	dfs(x+1,sum);//不选第x条
	if (sum+t[x]<=m)and(not v[s[x]])and(check(x)) then
		begin
			inc(l);a[l]:=s[x];
	        dfs(x+1,sum+t[x]);//选x
			dec(l);
		end;
end;
procedure qsort(s,t:longint);
var
	i,j,k,u:longint;
begin
	i:=s;j:=t;k:=ta[(s+t)shr 1];
	repeat
		while ta[j]>k do dec(j);
		while ta[i]<k do inc(i);
		if i<=j then
			begin
				u:=ta[i];ta[i]:=ta[j];ta[j]:=u;
				inc(i);dec(J);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
begin
	readln(m,n);cost:=0;
	for i:=1 to n do readln(s[i],t[i]);
	while true do
		begin
			readln(x,y);
			if (x=0)and(y=0) then break;
			if (x>0)and(y>0) then begin flag[x,y]:=true;flag[y,x]:=true;end;
        end;
	dfs(1,0);
	writeln(ans,' ',cost);
	qsort(1,ans);
	for i:=1 to ans do writeln(ta[i]);
end.

