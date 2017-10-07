var
	tmp,i,j,m,s,t,time,ts:longint;
	f:array[0..300001]of longint;
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
begin
	readln(m,s,t);
	for i:=1 to t do
		if m>=10 then
			begin
				f[i]:=f[i-1]+60;
				dec(m,10);
			end
		else
			begin
				f[i]:=f[i-1];
				inc(m,4);
			end;
	for i:=1 to t do f[i]:=max(f[i],f[i-1]+17);
	for I:=T DOWNTO 0 DO
		IF F[i]<s then
			break;
	if s<=f[t] then
		begin
			writeln('Yes');
			writeln(i+1);
		end
	else
		begin
			writeln('No');
			writeln(f[t]);
		end;
end.

