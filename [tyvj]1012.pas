const
	a:array[0..9]of longint=(6,2,5,5,4,5,6,3,7,6);
var
	i,j:longint;
	ans,n:longint;
function ok(x,y:longint):boolean;
var
	i,r,c1,c2,c3,t:longint;
begin
	r:=0;
	c1:=0;c2:=0;c3:=0;
	t:=x;
        if x=0 then inc(c1,6);
	while t>0 do
		begin
		r:=t mod 10;
		t:=t div 10;
		inc(c1,a[r]);
		end;
	t:=y;
        if y=0 then inc(c2,6);
	while t>0 do
		begin
		r:=t mod 10;
		t:=t div 10;
		inc(c2,a[r]);		
		end;
	t:=x+y;
        if t=0 then inc(c3,6);
	while t>0 do
		begin
		r:=t mod 10;
		t:=t div 10;
		inc(c3,a[r]);
		end;
	if c1+c2+c3+4=n then
                exit(true);
	exit(false);
end;
procedure dfs(K:longint);
var
        j:longint;
begin
	for j:=0 to 1000 do
		if ok (k,j) then
                        inc(ans);
end;
begin
	readln(n);
	for i:=0 to 1000 do
		dfs(i);
	writeln(ans);

end.
