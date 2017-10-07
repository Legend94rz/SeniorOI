var
	l,r:array['A'..'Z']of longint;
	i,j,n,dpos,g,last:longint;
	s:string;
	c:char;
	ok:array[1..9]of boolean;
function ha(c:char;ct:integer):boolean;
var
	o:char;
begin
	for o:=c to 'Z' do
		if(o<>c)then
			if(ct=1)and(l[o]<>0)then
				exit(true)
			else
				if(ct=2)and(r[o]<>0)then
					exit(true);
	exit(false);
end;
function dfs:longint;
var
	b:boolean;
	p,t:longint;
	bol:array['A'..'Z']of boolean;
begin
	fillchar(ok,sizeof(ok),1);
	for p:=9 downto 2 do
	begin
		for c:='A' to 'Z' do
			if(l[c]mod p<>0)or (r[c]mod p<>0)then
			begin
				bol[c]:=false;
				break;
			end
			else
				bol[c]:=true;
		for c:='A' to 'Z' do
			if not bol[c] then
				begin
					ok[p]:=false;
					break;
				end;
	end;
	for p:=9 downto 2 do
		if ok[p] then
			exit(p);
	exit(1);
end;
procedure init(var s:string);
var
	i:longint;
	q:ARRAY[0..256]of longint;
	r:longint;
begin
	if s[1]in['A'..'Z'] then insert('1',s,1);r:=0;
	for i:=1 to length(s) do
		if ((s[i]='+')or(s[i]='='))and(s[i+1]in['A'..'Z']) then
			begin
				inc(r);
				q[r]:=i+1;
			end;
	for i:=r downto 1 do
		insert('1',s,q[i]);
	//writeln(s);
end;
begin
	readln(n);
	for i:=1 to n do
		begin
			readln(s);
			INIT(S);
			dpos:=pos('=',s);
			for j:=1 to dpos-1 do
				if(s[j]in ['1'..'9'])then
					l[s[j+1]]:=l[s[j+1]]+ord(s[j])-ord('0');
			for J:=dpos+1 to length(s) do
				if (s[j]in['1'..'9'])then
					r[s[j+1]]:=r[s[j+1]]+ord(s[j])-ord('0');
		end;
	for c:='A' to 'Z' do
		if (l[c]<>0)and(r[c]<>0)then
			if l[c]>=r[c] then
				begin
					l[c]:=l[c]-r[c];
					r[c]:=0;
				end
			else
				begin
					r[c]:=r[c]-l[c];
					l[c]:=0;
				end;
	ok[1]:=true;
	g:=dfs;
	for c:='A' to 'Z' do
		begin
			l[c]:=l[c] div g;
			r[c]:=r[c] div g;
		end;
	for c:='A' to 'Z' do
		if l[c]<>0then
		begin
			if(l[c]>1)then
				write(l[c],c)
			else
				write(c);
			if ha(c,1)then
				write('+')
			else
				write('=');
		end;
	for c:='A' to 'Z' do
		if(r[c]<>0)then
		begin
			if(r[c]>1)then
				write(r[c],c)
			else
				write(c);
			if(ha(c,2))then
				write('+')
			else
				writeLn;
		end;
end.
