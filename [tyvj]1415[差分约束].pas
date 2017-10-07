var
	tot,x,y,z,i,j,n,m:longint;
	next,head,ed,e:array[0..30000]of longint;
	q:array[0..100001]of longint;
	l,r:longint;
	vis:array[0..5000]of boolean;
	d:array[0..5000]of longint;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure spfa;
var
	k,ege,b:longint;
begin
	l:=0;r:=1;q[r]:=n;vis[n]:=true;
	fillchar(d,sizeof(d),$7f);d[n]:=0;
	repeat
		inc(l);
		if l>=100000 then l:=1;
		k:=q[l];vis[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];//writeln(l,' ',r);
				if d[k]+e[ege]<d[b] then
					begin
						d[b]:=d[k]+e[ege];
						if not vis[b] then
							begin
								inc(r);if r>=100000 then r:=1;
								q[r]:=b;
								vis[b]:=true;
							end;
					end;
				ege:=next[ege];
			end;
	until l=r;
	writeln(-d[0]);
end;
begin
	readln(n,m);
	for i:=1 to m do
		begin
			readln(x,y,z);
			add(y,x-1,-z);
		end;
	for i:=1 to n do
		begin
			add(i-1,i,1);
			add(i,i-1,0);
		end;
	{for i:=0 to n do
		begin
			write(i);
			x:=head[i];
			while x<>0 do
				begin
					y:=ed[x];
					write('->(',y,',',e[x],')');
					x:=next[x];
				end;
			writeln;
		end;}
	spfa;
end.

