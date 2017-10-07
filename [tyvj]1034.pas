var
	i,j,n,k	:longint;
	f		:array[0..10001]of longint;
	work	:array[0..10001,0..1]of longint;
procedure qsort(s,t:longint);
var
	i,j,k	:longint;
	y		:array[0..1]of longint;
begin
	i:=s;j:=t;k:=work[i,0];
	repeat
		while work[j,0]>k do dec(j);
		while work[i,0]<k do inc(i);
		if i<=j then
			begin
				y:=work[i];work[i]:=work[j];work[j]:=y;
				inc(i);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
begin
	readln(n,k);
	for i:=1 to k do
		readln(work[i,0],work[i,1]);
	qsort(1,k);
	j:=K;
	for i:=n downto 1 do
		if work[j,0]<>i then
			f[i]:=f[i+1]+1
		else
			while work[j,0]=i do
				begin
					if f[i+work[j,1]]>f[i] then
						f[i]:=f[i+work[j,1]];
					dec(j);
				end;
	writeln(f[1]);
end.
