const
	dx:array[1..4]of longint=(-1,0,1,0);
	dy:array[1..4]of longint=(0,1,0,-1);
var
	tot,x,y,z,i,j,k,n,m:Longint;
	next,head,ed,e:array[0..500*500*8+1]of longint;
	q:array[0..4000001]of longint;
	l,r:longint;
	d:array[0..500*500+1]of longint;
	vis:array[0..500*500+1]of boolean;
	x1,x2,y1,y2:longint;
	ch:array[0..500,0..500]of char;
procedure add(x,y,z:longint);
begin
	//writeln(x,'->',y,' ',z);
	inc(tot);
	ed[tot]:=y;
	e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure spfa;
var
	k,ege,b:longint;
begin
	fillchar(d,sizeof(d),$7f);d[x1]:=0;
	l:=0;r:=1;q[r]:=x1;vis[x1]:=true;
	repeat
		inc(l);if l>=100000 then L:=1;
		k:=q[l];vis[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				if d[k]+e[ege]<d[b] then
					begin
						d[b]:=d[k]+e[ege];
						if not vis[b] then
							begin
								inc(r);if r>=100000 then r:=1;
								q[r]:=b;vis[b]:=true;
							end;
					end;
				ege:=next[ege];
			end;
	until l=r;
end;
begin
	readln(n,m);
	for i:=1 to n do
		begin
			for j:=1 to m do
				read(ch[i,j]);
			readln;
		end;
	for i:=1 to n do
		for j:=1 to m do
			for k:=1 to 4 do
				if (i+dx[k]<=n)and(i+dx[k]>=1)and(j+dy[k]<=m)and(j+dy[k]>=1) then
					if ch[i+dx[k],j+dy[k]]<>ch[i,j] then
						begin
							add((i-1)*m+j,(i+dx[k]-1)*m+j+dy[k],2);add((i+dx[k]-1)*m+j+dy[k],(i-1)*m+j,2);
						end
					else
						begin
							add((i-1)*m+j,(i+dx[k]-1)*m+j+dy[k],1);add((i+dx[k]-1)*m+j+dy[k],(i-1)*m+j,1);
						end;
	readln(x1,y1,x2,y2);
	x1:=(x1-1)*m+y1;x2:=(x2-1)*m+y2;
	spfa;
	writeln(d[x2]);
end.

