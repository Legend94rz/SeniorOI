var
	i,j,n,m,x,y:longint;
	b:array[0..1500,0..1500]of longint;
	v:array[0..1500]of longint;
	e:array[0..1500,0..1500]of boolean;
procedure bfs(k:longint);
var
	i,j,t:Longint;
	vis:array[0..1500]of boolean;
	q:array[0..1000000]of longint;
	l,r:longint;
begin
	fillchar(vis,sizeof(vis),0);
	l:=0;r:=1;q[1]:=k;
	repeat
		inc(l);
		t:=q[l];
		for i:=1 to v[t] do
			if (not vis[b[t,i]])or (b[t,i]=k) then
				begin
					if b[t,i]=k then
						begin
							writeln('T');
							exit;
						end;
					inc(r);
					q[r]:=b[t,i];
					vis[b[t,i]]:=true;
				end;
	until l>=r;
	writeln('F');
end;
begin
	assign(input,'message9.in');reset(input);assign(output,'message.out');rewrite(output);
	readln(n,m);
	for i:=1 to m DO
		BEGIN
			readln(x,y);
			if not e[x,y] then
				begin
					inc(v[x]);
					b[x,v[x]]:=y;
					e[x,y]:=true;
				end;
		END;
	for i:=1 to n do
		bfs(i);
	close(input);close(output);
end.
