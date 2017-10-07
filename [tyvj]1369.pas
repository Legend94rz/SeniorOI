var
	i,j,k,m,n,x,y,o:longint;
	a,b,e,d,f,p:array[0..2000]of longint;
	q:array[0..20000]of longint;
	ch:array[0..300]of char;
	vis:array[0..2000]of boolean;
function match:longint;
var
	i,l,st,ed:longint;
	k:longint;
	s:string;
begin
	s:='';
	for i:=1 to j do
		s:=s+ch[i];
	if ch[1]in['0'..'9'] then
		begin
			val(s,match);
			exit;
		end;
	if s='memory' then exit(0);
	if pos('memory',s)>0 then exit(1);
	for i:=1 to j do
		f[i]:=1;
	for i:=j-1 downto 1 do
		begin
			l:=0;
			for k:=i+1 to j do
				begin
				if (ch[k]>=ch[i])and(f[i]>l) then
					l:=f[i];
				if l>0 then
					f[i]:=l+1;
				if f[i]>=6 then exit(2);
				end;
		end;
	exit(j);
end;
function spfa(s:longint):longint;
var
	l,r,k,i:longint;
begin
	l:=0;r:=1;q[1]:=s;
	fillchar(vis,sizeof(vis),0);
	vis[s]:=true;
	fillchar(d,sizeof(d),$3f);
	d[s]:=0;
	repeat
		inc(l);
		k:=q[l];//write(k,' ',f[k],' ',f[k+1]-1,' ');
		for i:=p[k] to p[k+1]-1 do
                 begin
                        //writeln(i,' ',a[i], ' ',b[i],' ',e[i]);
                        if (d[k]+e[i]<d[b[i]]) then
				begin
					d[b[i]]:=d[k]+e[i];
					if not vis[b[i]] then
						begin
						inc(r);
						q[r]:=b[i];
						vis[b[i]]:=true;
						end;
				end;
                        end;
		vis[k]:=false;
	until l=r;
	exit(d[n]);
end;
procedure qsort(s,t:longint);
var
	i,j,y,k:longint;
begin
	i:=s;j:=t;k:=a[random(t-s+1)+s];
	repeat
		while a[j]>k do dec(j);
		while a[i]<k do inc(i);
		if (i<=j) then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				y:=b[i];b[i]:=b[j];b[j]:=y;
				y:=e[i];e[i]:=e[j];e[j]:=y;
				inc(i);dec(j);
			end;
	until i>=j;
        if (s<j)then qsort(s,j);
        if (i<t)then qsort(i,t);
end;
begin
	readln(n,m);
	randomize;
	for i:=1 to m do
		begin
			read(x,y);J:=0;
			a[i]:=x;b[i]:=y;
			a[i+m]:=y;b[i+m]:=x;
			while not eoln do
				begin
					read(ch[j]);
					inc(j);
				end;
			dec(j);
			e[i]:=match;
			e[i+m]:=e[i];
			readln;
		end;
	m:=m+m;
	qsort(1,m);
	for o:=1 to m do
		if p[a[o]]=0 then p[a[o]]:=o;
	p[N+1]:=m+1;
	for i:=n downto 1 do
		if p[i]=0 then p[I]:=p[I+1];
	writeln(spfa(1));
end.
