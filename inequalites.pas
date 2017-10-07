var
	a,b,e,d:array[0..11000]of longint;
	ind:array[0..2000]of longint;
	tot,n,m,i,j,k,p:longint;
	t:array[0..3]of longint;
	s:string;
procedure add(x,y,z:longint);
begin
	inc(tot);a[tot]:=x;b[tot]:=y;e[tot]:=z;
	inc(ind[y]);
end;
function ford:longint;
begin
	fillchar(d,sizeof(d),$3f);
	for i:=1 to n do
		if ind[i]=0 then begin d[i]:=0;break;end;
	for j:=0 to n do
		for k:=1 to tot do
			if d[a[k]]+e[k]<=d[b[k]] then
				d[b[k]]:=e[k]+d[a[k]];
	for i:=2 to n do
		if d[i]>d[1] then d[1]:=d[i];
	exit(d[1]);
end;
begin
	readln(n,m);
	for i:=1 to m do
		begin
		readln(s);
		p:=1;
		for k:=1 to 3 do begin
				for j:=p to length(s) do
					if (s[j]in['0'..'9']) then
					begin
						p:=j;
						break;
					end;
				j:=p+1;
				while s[j] in['0'..'9'] do
					inc(j);
				val(copy(s,p,j-p),t[k]);
				p:=j;
			end;
		add(t[2],t[1],t[3]);
		end;
	writeln(ford+1);
end.
