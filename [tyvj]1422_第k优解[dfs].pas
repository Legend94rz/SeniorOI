var
	k,i,j,n,v:longint;
	a,w:array[0..1001]of longint;
	ans:array[0..200001]of longint;
	l,l0:longint;
procedure qsort(s,t:longint);
var
	i,j,k,u:longint;
begin
	i:=s;j:=t;k:=ans[(s+t)shr 1];
	repeat
		while ans[j]<k do dec(j);
		while ans[i]>k do inc(i);
		if i<=j then
			begin
				u:=ans[i];ans[i]:=ans[j];ans[j]:=u;
				inc(i);dec(J);
            end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
procedure dfs(x,sv,su:longint);
var
	i:longint;
begin
	if x=n+1 then
		begin
			if (sv<=v)and(sv>0) then begin inc(l);ans[l]:=su;end;
			exit;
		end;
	if sv+a[x]<=v then dfs(x+1,sv+a[x],su+w[x]);
	if sv<=v then dfs(x+1,sv,su);
end;
begin
	readln(v,n);
	for i:=1 to n do readln(a[i],w[i]);
	readln(k);
	dfs(1,0,0);
	qsort(1,l);
	writeln(l);
//	for i:=1 to l do write(ans[i],' ');writeln;
	if k>l then writeln('Are You Crazy?') else writeln(ans[k]);
end.

