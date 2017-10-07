const
	m:array[0..15]of longint=(1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768);
var
	top,low,ans:longint;
	i,j,n:longint;
	a:array[0..5000]of -1..1;
function can:boolean;
var
	q,s:longint;
begin
	s:=0;
	for q:=1 to 2*n do
		if a[q]=0 then
			inc(s)
		else
			if (a[q]=1)then
				begin
				dec(s);
				if s<0 then exit(false);
				end;
	if s<>0 then exit(false);
	exit(true);
end;
function cal:longint;
var
	i,k:longint;
begin
	cal:=0;k:=0;
	for i:=2*n downto 1 do
		begin
			cal:=cal+a[i]*m[k];
			inc(k);
		end;
	exit(cal);
end;
procedure dfs(i:longint);
var
	j:longint;
begin
	if i>2*n then exit;
	for j:=0 to 1 do
		begin
		if (a[i]=-1) then
			begin
				a[i]:=j;
				if (i=2*n)and(can) then begin inc(top);end;
				dfs(i+1);
			end;
		a[i]:=-1;
		end;
end;
begin
	//assign(input,'count.in');assign(output,'count.out');reset(input);rewrite(output);
	readln(n);
        for i:=0 to n do
		a[i]:=-1;
        dfs(1);
	writeln(top);
	//close(input);close(output);
end.
