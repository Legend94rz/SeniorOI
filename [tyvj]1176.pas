var
	tot,i,n,m:longint;
	next,head,ed,e:array[0..150000]of longint;
	d:array[0..50001]of int64;
	vis:array[0..50001]of boolean;
	q:array[0..5000000]of longint;
	l,r:longint;
	x,y,z,mid:int64;
procedure add(x,y,z:longint);
begin
	inc(tot);
	e[tot]:=z;
	ed[tot]:=y;
	next[tot]:=head[x];
	head[x]:=tot;
end;
function spfa:boolean;
var
	k,b,ege:longint;
begin
	fillchar(d,sizeof(d),0);d[1]:=mid;
	fillchar(vis,sizeof(vis),0);vis[1]:=true;
	l:=0;r:=1;q[r]:=1;
	repeat
		inc(l);
		if L>=500000 then l:=1;
		k:=q[l];//vis[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				if d[k]*2+e[ege]>d[b] then
					begin
						d[b]:=d[k]*2+e[ege];
						{if mid=4 then
							writeln('from ',k,' to ',b,',val is ',e[ege],' start point is ',d[k],' res=',d[b]);}
						if not vis[b] then
							begin
								inc(r);
								if r>=500000 then r:=1;
								q[r]:=b;
								vis[b]:=true;
							end;
					end;
				ege:=next[ege];
			end;
	until l=r;
	//writeln(mid,' ',d[n]);
	exit(d[n]>0);
end;
begin
	readln(n,m);
	for i:=1 to m do
		begin
			readln(x,y,z);
			add(x,y,z);
		end;
	x:=1;y:=100000;
	repeat
		mid:=(x+y) shr 1;
		if spfa then
			y:=mid-1
		else
			x:=mid+1;
	until x>y;
	writeln(x);
end.

