var
	a,b,e:array[0..1000,0..1000]of longint;
	v,val:array[0..1000]of longint;
	i,j:longint;
	n:longint;
	ans,m,p:int64;
procedure spfa(s:longint);
var
	i,j,k:longint;
	vis:array[0..1000]of boolean;
	d:array[0..1000]of longint;
	q:array[0..100000]of longint;
	l,r:longint;
	t:int64;
begin
	t:=0;
	fillchar(d,sizeof(d),$3f);
	fillchar(vis,sizeof(vis),0);
	d[s]:=0;
	l:=0;r:=1;q[1]:=s;
	vis[s]:=true;
	repeat
		inc(l);
		k:=q[l];
		for i:=1 to v[k] do
			if d[k]+e[k,b[k,i]]<d[b[k,i]] then
				begin
					d[b[k,i]]:=d[k]+e[k,b[k,i]];
					if not vis[b[k,i]] then
						begin
							inc(r);
							q[r]:=b[k,i];
							vis[b[k,i]]:=true;
						end;
				end;
		vis[k]:=false;
	until l>=r;
	for i:=1 to n do
		inc(t,val[i]*d[i]);
	//writeln(s,' ',t);
	if t<ans then
		begin
			ans:=t;
			m:=s;
		end;
end;
begin
	readln(n);
	ans:=maxlongint;
        fillchar(e,sizeof(e),$3f);
	for i:=1 to 5 do
		for j:=1 to 5 do
			if i<>j then
				begin
					inc(v[i]);
					b[i,v[i]]:=j;
					e[i,j]:=(i*j)mod 10+(i+j)mod 6+1;
					e[j,i]:=e[i,j];
				end;
	for i:=6 to n do
		begin
			inc(v[i]);
			b[i,v[i]]:=i-1;
			inc(v[i]);
			b[i,v[i]]:=i-3;
			inc(v[i-1]);
			b[i-1,v[i-1]]:=i;
			inc(v[i-3]);
			b[i-3,v[i-3]]:=i;
			e[i,i-1]:=(i*(i-1))mod 10+(2*i-1)mod 6+1;
			e[i-1,i]:=e[i,i-1];
			e[i,i-3]:=(i*(i-3))mod 10+(2*i-3)mod 6+1;
			e[i-3,i]:=e[i,i-3];
		end;
	for i:=1 to n do
		begin
			val[i]:=((i-1) mod 10)+1;
			inc(p,val[i]);
		end;
	{for i:=1 to n do
		for j:=1 to n do
			if i<>j then
				writeln(i,' ',j,' ',e[i,j]);}
	for i:=1 to n do
		spfa(i);
	writeln(ans+p);
	writeln(m);
end.
