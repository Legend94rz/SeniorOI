var
	n:longint;
	used:array[1..9]of boolean;
	a:array[1..9]of longint;
procedure dfs(i:longint);
var
	k,j:longint;
begin
	if i>n then exit;
	for k:=1 to 9 do
		if not used[k] then
			begin
			used[k]:=true;
			a[i]:=k;
			if i=n then
				begin
				for j:=1 to n-1 do
					write(a[j],' ');
				writeln(a[n]);
				end;
			dfs(i+1);
			used[k]:=false;
			end;
end;
begin
	readln(n);
	dfs(1);
end.
