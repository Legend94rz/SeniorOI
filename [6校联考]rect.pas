var
	i,j,n,m,ans:longint;
	v,s:array[0..1001]of longint;
	vis:array[0..101]of boolean;
	a:array[0..101]of longint;
procedure calc;
var
	x,y,z,w:longint;
begin
	x:=s[a[2]]-s[a[1]];if x>s[n]/2 then x:=s[n]-x;
	y:=s[a[4]]-s[a[3]];if y>s[n]/2 then y:=s[n]-y;
	if x<>y then exit;
	z:=s[a[3]]-s[a[2]];if z>s[n]/2 then z:=s[n]-z;
	w:=s[a[4]]-s[a[1]];if w>s[n]/2 then w:=s[n]-w;
	if z<>w then exit;
	inc(ans);
end;
procedure dfs(x,y:longint);
var
	i:Longint;
begin
	if y=5 then begin
		calc;
		exit;
	end;
	for i:=x to n do
		if not vis[i] then
			begin
				a[y]:=i;
				vis[i]:=true;
				dfs(I+1,y+1);
				vis[i]:=false;
            end;
end;
begin
	assign(input,'rect.in');reset(input);assign(output,'rect.out');rewrite(output);
	readln(n);
	for i:=1 to n do begin readln(v[i]);s[i]:=s[i-1]+v[i];end;
	dfs(1,1);
	writeln(ans);
	close(output);
end.

