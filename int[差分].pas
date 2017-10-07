var
	maxn,x,y,n,mini,i,j,tot:longint;
	next,head,ed,e:array[-1..500000]of longint;
	q:array[0..200001]of longint;
	l,r:longint;
	vis:array[0..100000]of boolean;
	d:array[-1..200000]of longint;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;
	e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure spfa(s:longint);
var
	ege,k,b:longint;
begin
	fillchar(d,sizeof(d),$3f);d[s]:=0;
	fillchar(vis,sizeof(vis),0);vis[s]:=true;
	l:=0;r:=1;q[r]:=s;
	repeat
		inc(l);
		if l>=200000 then l:=1;
		k:=q[l];vis[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				if d[k]+e[ege]<d[b] then
					begin
						d[b]:=e[ege]+d[k];
						if not vis[b] then
							begin
								inc(r);
								if r>=200000 then r:=1;
								q[r]:=b;
								vis[b]:=true;
							end;
					end;
				ege:=next[ege];
			end;
	until l=r;
end;begin
	assign(input,'int.in');reset(input);assign(output,'int.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		begin
			readln(x,y);inc(y);
			if y>maxn then maxn := y;
			add(y,x,-2);
		end;
	for i:=0 to maxn-1 do
		add(i,i+1,1);
	for i:=1 to maxn do
		add(i,i-1,0);
	spfa(maxn);
	writeln(-d[0]);
	//writeln(d[0],' ',d[-1],' ',d[maxn],' ',d[1],' ',d[maxn+1]);
	close(output);
end.
