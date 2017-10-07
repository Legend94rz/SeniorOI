var
	i,j,n,x,y,z:longint;
	tot,max:longint;
	e,list,next,ed:array[0..2500005]of longint;
	d:array[0..50005]of longint;
procedure add(a,b,c:longint);
begin
	if (b>max)or(a>max) then exit;
	inc(tot);
	ed[tot]:=b;
	e[tot]:=c;
	next[tot]:=list[a];
	list[a]:=tot;
end;
procedure spfa;
var
	q:array[0..500000]of longint;
	vis:array[0..50005]of boolean;
	l,r:longint;
	i,k,edge:longint;
begin
	fillchar(vis,sizeof(vis),0);vis[0]:=true;
	fillchar(d,sizeof(d),$3f);d[0]:=0;
	l:=0;r:=1;q[r]:=0;
	repeat
		inc(l);
		k:=q[l];
		edge:=list[k];
		while edge<>0 do
			begin
				if d[k]+e[edge]<d[ed[edge]] then
					begin
						d[ed[edge]]:=e[edge]+d[k];
						if not vis[ed[edge]] then
							begin
								inc(r);
								q[r]:=ed[edge];
								vis[ed[edge]]:=true;
							end;
					end;
				edge:=next[edge];
			end;
		vis[k]:=false;
	until l>=r;
end;
begin
	readln(n);
	for i:=1 to n do
		begin
			read(x,y,z);
			inc(y);
			z:=-z;
			inc(tot);
			ed[tot]:=x;
			e[tot]:=z;
			next[tot]:=list[y];
			list[y]:=tot;
			if y>max then max:=y;
		end;
	{for i:=1 to n do
		begin
			read(x,y,z);if y>max then max:=y;
			add(y+1,x,-z);
			//if y>max then max:=y;
		end;}
	for i:=1 to max do
		begin
			add(0,i,0);
			add(i,i+1,1);
			add(i+1,i,0);
		end;
	spfa;
	writeln(d[max]-d[1]);
end.
