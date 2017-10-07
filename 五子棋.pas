program con1;
const
	dx:array[1..8]of longint=(-1,-1,0,1,1,1,0,-1);
	dy:array[1..8]of longint=(0,1,1,1,0,-1,-1,-1);
var
	ch:array[0..20,0..20]of char;
	i,j,n,m,k:longint;
	u:longint;
	win:array['O'..'X']of boolean;
function check(ct:char;x,y,d:longint):longint;
var
	i,j:longint;
	step:longint;
begin
	i:=x;j:=y;
	step:=0;
	while (ch[i,j]=ct)and(i in [1..15])and(j in [1..15]) do
		begin
			i:=i+dx[d];
			j:=j+dy[d];
			inc(step);
		end;
	exit(step);
end;
begin
	assign(input,'game.in');reset(input);assign(output,'game.out');rewrite(output);
	readln(m);
	for u:=1 to m do
		begin
			for i:=1 to 15 do
				begin
					for j:=1 to 15 do
						read(ch[i,j]);
					readln;
				end;
			readln;
			fillchar(win,sizeof(win),0);
			for i:=1 to 15 do
				for j:=1 to 15 do
					if ch[i,j]in['X','O'] then
						for k:=1 to 8 do
							if check(ch[i,j],i,j,k)>=5 then
								win[ch[i,j]]:=true;
			if (win['X'])and(not win['O']) then writeln('X win.');
			if (win['O'])and(not win['X']) then writeln('O win.');
			if (win['X'])and(win['O'])or(not win['X'])and(not win['O']) then
				writeln('I don''t know.');
		End;
	close(output);
end.
