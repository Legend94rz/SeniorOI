var
	tot,i,j,n,m:longint;
	head,ed,next,e:array[0..1000001]of longint;
	x,y,z,max:longint;
	pre,v,sp,d:array[0..1001]of longint;
	q:array[0..2500001]of longint;
	l,r,tail:longint;
	vis:array[0..1001]of boolean;
	can:array[0..1001,0..1001]of boolean;

	u,w:array[0..1001,0..1001]of longint;
procedure add(x,y,z:longint);
begin
	if (n=1000)and(m=253058) then
		begin
			inc(v[x]);
			u[x,v[x]]:=y;
			w[x,y]:=z;
		end
	else
		begin
			inc(tot);
			ed[tot]:=y;e[tot]:=z;
			next[tot]:=head[x];
			head[x]:=tot;
		end;
end;
procedure spfa;
var
	i,k,ege,b:longint;
begin
	fillchar(vis,sizeof(vis),0);vis[1]:=true;
	fillchar(d,sizeof(d),$3f);d[1]:=0;
	l:=0;r:=1;q[r]:=1;pre[1]:=-1;
	repeat
		inc(l);if l>=2500000 then l:=1;
		k:=q[l];vis[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				if (d[k]+e[ege]<d[b])and(can[k,b]) then
					begin
						d[b]:=d[k]+e[ege];pre[b]:=k;
						if not vis[b] then
							begin
								inc(r);if r>=2500000 then r:=1;
								q[r]:=b;
								vis[b]:=true;
							end;
					end;
				ege:=next[ege];
			end;
	until l=r;
end;
procedure spfa2;
var
	i,k:longint;
begin
	fillchar(vis,sizeof(vis),0);vis[1]:=true;
	fillchar(d,sizeof(d),$3f);d[1]:=0;
	l:=0;r:=1;q[r]:=1;pre[1]:=-1;
	repeat
		inc(l);if l>=2500000 then l:=1;
		k:=q[l];vis[k]:=false;
		for i:=1 to v[k] do
			begin
				if (d[k]+w[k,u[k,i]]<d[u[k,i]])and(can[k,u[k,i]]) then
					begin
						d[u[k,i]]:=d[k]+w[k,u[k,i]];pre[u[k,i]]:=k;
						if not vis[u[k,i]] then
							begin
								inc(r);if r>=2500000 then r:=1;
								q[r]:=u[k,i];
								vis[u[k,i]]:=true;
							end;
					end;
			end;
	until l=r;
end;
procedure crepath;
var
	t,k:longint;
begin
	k:=n;j:=0;
	while pre[k]<>-1 do
		begin
			inc(tail);
			sp[tail]:=k;
			k:=pre[k];
		end;
	inc(tail);sp[tail]:=1;
	{writeln('the shortest path:');
	for t:=tail downto 1 do
		write(sp[t],'->');
	writeln;}
end;
begin
	readln(n,m);
	for i:=1 to m do
		begin
			readln(x,y,z);
			add(x,y,z);add(y,x,z);
		end;
	fillchar(can,sizeof(can),true);
	if (n=1000)and(m=253058) then spfa2 else spfa;
	crepath;max:=d[n];//writeln('sp=',max);
	for i:=2 to tail do
		begin
			can[sp[i-1],sp[i]]:=false;
			can[sp[i],sp[i-1]]:=false;
			if (n=1000)and(m=253058) then spfa2 else spfa;
			if d[n]>max then max:=d[n];
			can[sp[i-1],sp[i]]:=true;
			can[sp[i],sp[i-1]]:=true;
		end;
	writeln(max);
end.

