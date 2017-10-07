program poj1014;
var
	i,j,n,v,count:longint;
	f:array[0..200005]of boolean;
	k:array[0..6]of longint;
	allzero:boolean;
procedure mutiplepack(cost,ki:longint);
var
	m,i:longint;
begin
	m:=1;
	while ki>0 do
		begin
			if m>ki then m:=ki;
			ki:=ki-m;
			for i:=v downto m*cost do
				if (f[i-m*cost])or(f[i]) then
					f[i]:=true;
			m:=m*2;
		end;
end;
begin
	while true do
		begin
			inc(count);v:=0;
			fillchar(f,sizeof(f),0);f[0]:=true;
			for i:=1 to 6 do
				begin
					read(k[i]);
					inc(v,i*k[i]);
				End;
			if v=0 then break;
			writeln('Collection #',count,':');
			if odd(v) then
				begin
					writeln('Can''t be divided.');
					writeln;
 					continue;
				end;
			for i:=1 to 6 do
				mutiplepack(i,k[i]);
			if f[v div 2] then
				writeln('Can be divided.')
			else
				writeln('Can''t be divided.');
			writeln;
		end;
end.
