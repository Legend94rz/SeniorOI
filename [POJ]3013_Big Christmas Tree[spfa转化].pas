var
	i,j,n,m,t,u:longint;
	next,head,ed,e:array[0..4000000]of longint;
	tot,x,y,z:longint;
	ans:qword;
	w:array[0..1000000]of longint;
	f:boolean;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure spfa;
var
	q:array[0..300001]of longint;
	vis:array[0..100000]of boolean;
	i,l,r,k,b,ege:longint;
	d:array[0..100000]of qword;
begin
	for i:=1 to n do d[i]:=999999999999;d[1]:=0;
	fillchar(vis,sizeof(vis),0);vis[1]:=true;
	l:=1;r:=2;q[1]:=1;
	repeat
		//inc(l);if l>=300000 then l:=1;
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
								//inc(r);if r>=300000 then r:=1;
								q[r]:=b;vis[b]:=true;
                                inc(r);if r>=300000 then r:=1;
							end;
					end;
				ege:=next[ege];
            end;
            inc(l);if l>=300000 then l:=1;
	until l=r;
	for i:=1 to n do
		if d[i]<999999999999 then
	        ans:=ans+d[i]*w[i]
		else
			begin
				f:=true;
				exit;
            end;

end;
begin
	readln(t);
	for u:=1 to t do
		begin
			readln(n,m);tot:=0;fillchar(next,sizeof(next),0);fillchar(head,sizeof(head),0);
			f:=false;
			if n=0 then
				begin
					writeln(0);
					continue;
				end;
            ans:=0;
			for i:=1 to n do read(w[i]);
			for i:=1 to m do
				begin
					readln(x,y,z);
					add(x,y,z);
					add(y,x,z);
				end;
			spfa;
			if not f then writeln(ans)
			else
				writeln('No Answer');
		end;
end.

