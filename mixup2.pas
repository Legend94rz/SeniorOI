var
	i,j,n,m,k,ANS:longint;
	s,a:array[0..30]of longint;
	usd:array[0..30]of boolean;
procedure dfs(x:longint);
var
	i:longint;
begin
	if x=n+1 then begin inc(ans);exit;end;
	for i:=1 to n do
		if (not usd[i])and((abs(s[i]-a[x-1])>k)or(x=1)) then
			begin
				usd[i]:=true;
				a[x]:=s[i];
				dfs(x+1);
				usd[i]:=false;
            end;
end;
begin
	assign(input,'mixup2.in');reset(input);assign(output,'mixup2.out');rewrite(output);
	readln(n,k);
	for i:=1 to n do readln(s[i]);
	dfs(1);
	writeln(ans);
	close(output);
end.

