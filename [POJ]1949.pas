var
	d:array[0..10000]of longint;
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
procedure work;
var
	i,j,k,t,n,ans,w,x:longint;
begin
	readln(n);
	fillchar(d,sizeof(d),0);
	for i:=1 to n do
		begin
			read(w,t);d[i]:=w;
			for j:=1 to t do
				begin
					read(x);
					d[i]:=max(d[i],d[x]+w);
				end;
			readln;
		end;
	ans:=0;
	for i:=1 to n do
		ans:=max(ans,d[i]);
	writeln(ans);
end;
begin
        while not eof do
		work;
end.