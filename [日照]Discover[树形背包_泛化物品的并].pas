var
	i,j,n,m,y,z,w,k,tot:Longint;
	x:array[0..1001]of longint;
	f,c,v,g:array[0..1001,0..1001]of longint;
	head,ed,e,next:array[0..100001]of longint;
	vis:array[0..10001]of boolean;
procedure dfs(k:longint);
var
	i,j,b,ege:longint;
	isleaf:boolean;
begin
	ege:=head[k];isleaf:=true;
	vis[k]:=true;
	while ege<>0 do
		begin
			b:=ed[ege];
			if vis[b] then begin ege:=next[ege];continue;end;
			isleaf:=false;//writeln('>>>>>',b);
			dfs(b);
			for i:=m-1 downto 0 do
				for j:=0 to i-2*e[ege] do
						if f[k,i]<f[k,i-2*e[ege]-j]+f[b,j] then
							f[k,i]:=f[k,i-2*e[ege]-j]+f[b,j];
			ege:=next[ege];
        end;
end;
procedure add(x,y,z:Longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
begin
	assign(input,'discover.in');reset(input);assign(output,'discover.out');rewrite(output);
	readln(n,m);
	for I:=1 to n do
		begin
			read(x[i]);
			for j:=1 to x[i] do read(v[i,j],c[i,j]);
		end;
	for I:=1 to n-1 do
		begin
			readln(y,z,w);
			add(y,z,w);add(z,y,w);
		end;
	for i:=1 to n do
		for j:=1 to x[i] do
			for k:=m-1 downto c[i,j] do
				if g[i,k]<g[i,k-c[i,j]]+v[i,j] then
					g[i,k]:=g[i,k-c[i,j]]+v[i,j];
	f:=g;
	//for I:=1 to n do writeln('>>',g[i,m-1]);
	dfs(1);
	writeln(f[1,m-1]);
	close(output);
end.

