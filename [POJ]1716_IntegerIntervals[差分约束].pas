var
	i,j,n,m:longint;
	a,b:longint;
	ed,e,head,next:array[0..3000000]of longint;
	tot:longint;
	d:array[0..100000]of longint;
	vis:array[0..100000]of boolean;
procedure add(x,y,z:longint);
begin
    inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure spfa;
var
	q:array[0..300000]of longint;
	l,r:longint;
	ege,b,k:longint;
begin
	fillchar(d,sizeof(d),$3f);d[m]:=0;
	vis[m]:=true;q[1]:=m;l:=0;r:=1;
	repeat
		inc(l);if l>=300000 then l:=1;
        k:=q[l];ege:=head[k];vis[k]:=false;
		while ege<>0 do
			begin
				b:=ed[ege];
				if d[k]+e[ege]<d[b] then
					begin
						d[b]:=d[k]+e[ege];
						if not vis[b] then
							begin
								inc(r);if r>=300000 then r:=1;
								q[r]:=b;vis[b]:=true;
                            end;
                    end;
				ege:=next[ege];
            end;
	until l=r;
	writeln(d[m]-d[0]);
end;
begin
	readln(n);
	for i:=1 to n do
		begin
			readln(a,b);inc(b);add(b,a,-2);
			if b>m then m:=b;
        end;
	{for i:=1 to m do add(i,i-1,0);
	for i:=1 to m do add(i,i+1,1);}
	for i:=1 to m do
		begin
			add(i,i-1,0);
			add(i-1,i,1);
		end;
	spfa;
end.

