var
	i,j,n,m:longint;
	ed,next,head:array[-1..1000001]of longint;
	tot,nn:longint;
	Ch:CHAR;
	fmax,fmin:array[-1..1000001,-1..4]of longint;
procedure add(x,y:longint);
begin
	inc(tot);
	ed[tot]:=y;
	next[tot]:=head[x];
	head[x]:=tot;
end;
function max(a,b,c:int64):int64;
begin
	max:=a;
	if max<b then max:=b;
	if max<c then max:=c;
end;
function min(a,b,c:int64):int64;
begin
	min:=a;
	if min>b then min:=b;
	if min>c then min:=c;
end;
procedure cons(x:Longint);
var
	t,i:longint;
	ch:char;
begin
	read(ch);if not (ch in['0'..'2']) then exit;
	for I:=1 to ord(ch)-48 do
		begin
		    inc(nn);add(x,nn);//writeln('>',x,'->',nn,' ',ch);
            cons(nn);
		end;
	IF ch='0' then add(x,-1);
end;
function dfs(x,y:longint):longint;//y:0-R;	1-G;	2-B
var
	i,j:longint;
	b,ege:longint;
begin
	if x=-1 then exit(0);
	if fmax[x,y]<>-1 then exit(fmax[x,y]);
	ege:=head[x];
	while ege<>0 do
		begin
			b:=ed[ege];
			for i:=0 to 2 do if i<>y then fmax[b,i]:=dfs(b,i);
			ege:=next[ege];
        end;
	for i:=0 to 2 do
		if i<>y then
			for j:=0 to 2 do
				if (i<>j)and(j<>y) then
					if fmax[ed[head[x]],i]+fmax[ed[next[head[x]]],j]>fmax[x,y] then
						fmax[x,y]:=fmax[ed[head[x]],i]+fmax[ed[next[head[x]]],j];
	if y=1 then inc(fmax[x,y]);
	exit(fmax[x,y]);
end;
function dfs2(x,y:longint):longint;
var
	i,j,b,ege:longint;
begin
	if x=-1 then exit(0);
	if fmin[x,y]<>$3f3f3f3f then exit(fmin[x,y]);
	ege:=head[x];
	while ege<>0 do
		begin
			b:=ed[ege];
			for i:=0 to 2 do if i<>y then fmin[b,i]:=dfs2(b,i);
			ege:=next[ege];
		end;
	for i:=0 to 2 do
		if i<>y then
			for j:=0 to 2 do
				if (I<>j) and(j<>y) then
					if fmin[ed[head[x]],i]+fmin[ed[next[head[x]]],j]<fmin[x,y] then
						fmin[x,y]:=fmin[ed[head[x]],i]+fmin[ed[next[head[x]]],j];
	if y=1 then inc(fmin[x,y]);
	exit(fmin[x,y]);
end;
begin
	assign(input,'tree.in');reset(input);assign(output,'tree.out');rewrite(output);
	nn:=1;
	cons(1);
	fillchar(fmax,sizeof(fmax),$FF);for i:=0 to 2 do fmax[0,i]:=0;
	fillchar(fmin,sizeof(fmin),$3F);for I:=0 to 2 do fmin[0,i]:=0;
	for i:=0 to 2 do dfs(1,i);
	write(max(fmax[1,0],fmax[1,1],fmax[1,2]),' ');
	for i:=0 to 2 do dfs2(1,i);
	writeln(min(fmin[1,0],fmin[1,1],fmin[1,2]));
	close(output);
end.

