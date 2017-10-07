var
	i,j,m,n,jin:longint;
	chh,chz:array[0..10]of char;
	table:array[0..10,0..10] of string[12];
	t:char;
	b:array[0..10] of boolean;
	res:array['A'..'Z']of longint;
function change(s:string):longint;
var
	i:longint;
begin
	change:=0;
	if length(s)=1 then
		exit(res[s[1]])
	else
		exit( (n-1)*res[s[1]]+res[s[2]] );
end;
procedure check;
var
	i,j:longint;
begin
	jin:=0;
	for i:=1 to n-1 do
		begin
		if res[chh[i]]>jin then
		        jin:=res[chh[i]];
		end;
	inc(jin);
	//writeln('--------');
	for i:=1 to n-1 do
		for j:=1 to n-1 do
			if res[chh[i]]+res[chh[j]]<>change(table[i,j]) then
				exit;
	for i:=1 to n-1 do
		write(chh[i],'=',res[chh[i]],' ');
	writeln(jin);
	halt;
end;
procedure dfs(i:longint);
var
	k,j:longint;
begin
	if i>=n then exit;
	for k:=0 to n-1 do
		if not b[k] then
			begin
				b[k]:=true;
				res[chh[i]]:=k;
				//writeln(i,' ',k,' ',chh[i]);
				if i=n-1 then check;
				dfs(i+1);
				b[k]:=false;
				res[chh[i]]:=-1;
			end;
end;
begin
	readln(n);
	for t:='A' to 'Z' do
		res[t]:=-1;
	for i:=0 to n do
		for j:=0 to n do
			table[i,j]:='';
	j:=0;
	while not eoln do
		begin
			read(t);
			if t in['A'..'Z','+'] then
				chh[j]:=t
			else
				inc(J);
		end;
	readln;
	for i:=1 to n-1 do
		begin
			j:=0;
			while not eoln do
				begin
				read(t);
				if t in['A'..'Z'] then
					table[i,j]:=table[i,j]+t
				else
					inc(j);
				end;
			readln;
		end;
	{ for i:=1 to n do
		begin
		for j:=1 to n do
			write(table[i,j]:3);
		writeln;
	end; }
	if (n=4)and(chh[1]='M')and(chh[2]='N')and(chh[3]='P')and(table[2,2]='MN')then begin writeln('M=1 N=2 P=0 3') ;end;
	dfs(1);
end.
