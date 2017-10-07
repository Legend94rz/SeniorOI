uses math;
var
	i,j,n,m,ans:longint;
	b,e:array[0..1501,0..1501]of longint;
	q:array[0..100001]of longint;
	l,r:longint;
	vis:array[0..1501]of boolean;
	d,v:array[0..1501]of longint;
	x1,y1,x2,y2,x,y,z:longint;
	rec:array[1..4,0..1501]of longint;
	count:longint;
procedure add(x,y,z:longint);
begin
	inc(v[x]);
	b[x,v[x]]:=y;
	e[x,y]:=z;
end;
procedure spfa(s:longint);
var
	i,k:longint;
begin
	fillchar(vis,sizeof(vis),0);vis[s]:=true;
	fillchar(d,sizeof(d),$3f);d[s]:=0;
	l:=0;r:=1;q[r]:=s;
	repeat
		inc(l);
		if l>=100000 then l:=1;
		k:=q[l];vis[k]:=false;
		for i:=1 to v[k] do
			if d[k]+e[k,b[k,i]]<d[b[k,i]] then
				begin
					d[b[k,i]]:=d[k]+e[k,b[k,i]];
					if not vis[b[k,i]] then
						begin
							inc(r);if r>=100000 then r:=1;
							q[r]:=b[k,i];
							vis[b[k,i]]:=true;
						end;
				end;
	until l=r;
	inc(count);
	rec[count]:=d;
end;
begin
	readln(n,m,x1,y1,x2,y2);
	for i:=1 to m do
		begin
			readln(x,y,z);
			add(x,y,z);add(y,x,z);
		end;
	spfa(x1);spfa(y1);
	spfa(x2);spfa(y2);
	for i:=1 to n do
		for j:=1 to n do
			begin
				if (rec[1,i]+rec[2,i]=rec[1,y1])and(rec[1,j]+rec[2,j]=rec[1,y1])and(rec[3,i]+rec[4,i]=rec[3,y2])and(rec[3,j]+rec[4,j]=rec[3,y2]) then
					ans:=max(ans,abs(rec[1,i]-rec[1,j]));
			end;
        writelN(ans);
end.

