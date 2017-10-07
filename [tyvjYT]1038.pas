var
	i,j,n,p,x,y,z,k:longint;
	a,b,e:array[0..500,0..500]of longint;
	vis,yes,ind:array[0..500]of boolean;
	ci,ui,q,v:array[0..500]of longint;
	l,r,ta:longint;
	flag:boolean;
procedure extend;
var
	z,t:longint;
begin
	repeat
		inc(l);
		k:=q[l];
		if (ci[k]<>0)and(not yes[k]) then flag:=true;
			//continue;
		if ((v[k]>0)or(not yes[k]))and(n>1)and(ind[k]) then
			ci[k]:=ci[k]-ui[k];
		if ci[k]<=0 then ci[k]:=0;
		for i:=1 to v[k] do
			begin
			z:=b[k,i];
			ci[z]:=ci[z]+e[k,z]*ci[k];
			if (ci[z]<>0)and(not yes[z]) then flag:=true;
			if not vis[z] then
				begin
					inc(r);
					q[r]:=z;
					vis[z]:=true;
				end;
			end;
	until l>=r;end;
begin
	readln(n,p);
	for i:=1 to n do
		begin
		readln(ci[i],ui[i]);
		if ci[i]<>0 then
			begin
				inc(r);
				q[r]:=i;
			end;
		end;
	for i:=1 to p do
		begin
			readln(x,y,z);
			inc(v[x]);
			b[x,v[x]]:=y;
			e[x,y]:=z;
			ind[y]:=true;//有入度
			yes[x]:=true;//不是终点
		end;
	{for i:=1 to n do
		if not yes[i] then
			writeln(i);}
	extend;
	if not flag then
		writeln('NULL')
	else
		for i:=1 to n do
			if (not yes[i])and(ci[i]<>0) then
				writeln(i,' ',ci[i]);
end.
