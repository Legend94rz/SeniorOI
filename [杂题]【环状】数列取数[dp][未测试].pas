var
	i,j,n,m,k,ans:longint;
	a:array[0..4001]of longint;
	f:array[-1..4001,-1..4001]of longint;
function max(a,b:Longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
function deal(i,j:Longint):longint;
begin
	if f[i,j]<>-99999999 then exit(f[i,j]);
	if (i=1)and(j=1) then begin f[i,j]:=a[i];exit(a[1]);end;
	if (j=i)and(j<=0) then begin f[i,j]:=0;exit(0);end;
	if (j>i div 2+i mod 2) then begin f[i,j]:=-999999999;exit(f[i,j]);end;
	f[i,j]:=max( deal(i-1,j),deal(i-2,j-1)+a[i] );
    exit(f[i,j]);
end;
begin
	readln(n,m);ans:=-maxlongint;
	for i:=1 to n do read(a[i]);
	for i:=-1 to n do for j:=-1 to n do f[i,j]:=-99999999;
	for k:=1 to 2 do
		begin
			if deal(n-1,m)>ans then ans:=deal(n-1,m);
			for i:=-1 to n do for j:=-1 to n do f[i,j]:=-99999999;
			for i:=1 to n-1 do a[i]:=a[i+1];
		end;
	writeln(ans);
end.

