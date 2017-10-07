var
	i,j,n,m,ans:longint;
	f:array[-1..1,-1..4001,0..1]of longint;
	a:array[0..4001]of longint;
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(B);
end;
procedure dp;
var
	i,j:longint;
begin
	for i:=2 to n do
		for j:=0 to m do
			begin
				f[i and 1,j,0]:=max(f[(i-1)and 1,j,1],f[(i-1)and 1,j,0]);
				f[i and 1,j,1]:=max(f[(i-1)and 1,j-1,1]+a[i],f[(i-1)and 1,j-1,0]);
            end;
end;
begin
	//assign(input,'naptime.in');reset(input);assign(output,'naptime.out');rewrite(output);
	readln(n,m);
	if m<=0 then begin writeln(0);{close(output);}exit;end;
	for I:=1 to n do readln(a[i]);
    fillchar(f,sizeof(f),$80);f[1,1,1]:=0;f[1,0,0]:=0;
	dp;
	ans:=max(f[n and 1,m,1],f[n and 1,m,0]);
	fillchar(f,sizeof(f),$80);
	f[1,1,1]:=a[1];//			f[1,1,0]:=a[1];
	dp;
	ans:=max(ans,f[n and 1,m,1]);
	writeln(ans);
	//close(output);
end.

