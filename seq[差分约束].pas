var
	i,j,n,m:longint;
	k,p,q,tot:longint;
	a:array[-1..2000]of longint;
	b,e:array[-1..2000]of longint;
	l,r:longint;
	d:array[-1..2000] of longint;
function ford:boolean;
var
	f:boolean;
begin
	for i:=0 to n do
		begin
		f:=false;
		for j:=1 to m do
			if d[a[j]]+e[j]<d[b[j]] then
				begin
				d[b[j]]:=d[a[j]]+e[j];
				f:=true;
				end;
		if not f then exit(true);
		end;
	exit(false);
end;
begin
	//assign(output,'seq.out');assign(input,'seq.in');reset(input);rewrite(output);
	readln(n,m);
	for i:=1 to m do
		begin
		readln(j,k,p,q);
		if p=1 then
			begin
			a[i]:=j+k;b[i]:=j-1;e[i]:=-q-1;
			end
		else
			begin
			a[i]:=j-1;b[i]:=j+k;e[i]:=q-1;
			end;
		end;
        fillchar(d,sizeof(d),0);
	if ford then
		writeln('YES')
	else
		writeln('NO');
	//close(output);close(input);
end.
