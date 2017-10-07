program ty1194;
var
	i,j:longint;
	f:array[0..201000]of boolean;
	n:longint;
	a:array[0..6]of longint;
	s:longint;
procedure mutipack(cost,k:longint);
var
	i,m:longint;
begin
	m:=1;
	while k>0 do
		begin
			if m>k then m:=k;
			k:=k-m;
			for i:=s downto m*cost do
				if f[i-m*cost] then
					f[i]:=true;
			m:=m shl 1;
		end;
end;
begin
	while true do
		begin
			s:=0;fillchar(f,sizeof(f),0);
			for i:=1 to 6 do
				begin
					read(a[i]);inc(s,a[i]*i);
				end;
			if s=0 then break;
			f[0]:=true;
			if s and 1=1 then begin writeln('Can''t');continue;end;
			for i:=1 to 6 do
				mutipack(i,a[i]);
			if f[s shr 1] then
				writeln('Can')
			else
				writeln('Can''t');
		End;

end.
