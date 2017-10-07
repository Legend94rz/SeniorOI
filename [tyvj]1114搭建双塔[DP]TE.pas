{var
	i,j,n,m,k,sum:longint;
	a:array[0..1001]of longint;
	f:array[0..101,0..1001,0..1001]of boolean;
begin
	readln(n);
	for i:=1 to n do begin read(a[i]);inc(sum,a[i]);end;
	f[0,0,0]:=true;//writeln('::',sum shr 1);
	for i:=1 to n do
		for j:=0 to sum shr 1 do
			for k:=0 to sum shr 1 do
				begin
					f[i,j,k]:=f[i-1,j,k];
                    if j>=a[i] then f[i,j,k]:=f[i,j,k]or f[i-1,j-a[i],k];
                    if k>=a[i] then f[i,j,k]:=f[i,j,k]or f[i-1,j,k-a[i]];
				end;
	for i:=sum shr 1 downto 1 do
		if f[n,i,i] then
			begin
				writeln(i);
				exit;
			end;
	writeln('Impossible');
end.}
var
	f:array[0..101,0..10001]of longint;
	a:array[0..1001]of longint;
	i,j,n,sum:longint;
begin
	readln(n);
	for i:=1 to n do begin read(a[i]);inc(sum,a[i]);end;
	fillchar(f,sizeof(f),255);f[0,0]:=0;
	for i:=1 to n do
		for j:=0 to sum shr 1 do
			if f[i-1,j]<>-1 then
			begin
				if f[i-1,j]>f[i,j] then f[i,j]:=f[i-1,j];
				if f[i-1,j]>f[i,j+a[i]] then f[i,j+a[i]]:=f[i-1,j];
				if a[i]<=j then
					begin
						if f[i,j-a[i]]<f[i-1,j]+a[i] then
							f[i,j-a[i]]:=f[i-1,j]+a[i]
					end
				else
					begin
						if f[i,a[i]-j]<f[i-1,j]+j then
							f[i,a[i]-j]:=f[i-1,j]+j;
					end;
			end;
	if f[n,0]>0 then
		writeln(f[n,0])
	else
		writeln('Impossible');
end.

