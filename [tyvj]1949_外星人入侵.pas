var
	i,j,n,m,A,Key:longint;
	ed,e,head,next:array[0..1000001]of longint;
	x,y,z,tot,ans:Longint;
	v,f:array[0..100001]of boolean;
	q,d:array[0..1000001]of longint;
procedure add(x,y,z:Longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure spfa(s:longint);
var
	k,b,ege,l,r:longint;
begin
	l:=0;r:=1;q[r]:=s;
	fillchar(v,sizeof(v),0);v[s]:=true;
	d[s]:=0;if f[s] then begin dec(ans);f[s]:=false;end;
	repeat
		inc(l);if l>=1000000 then l:=1;
		k:=q[l];v[k]:=false;
		ege:=head[k];
		while ege<>0 do
		begin
			b:=ed[ege];
			if d[k]+e[ege]<d[b] then
				begin
					d[b]:=d[k]+e[ege];
					if not v[b] then
						begin
							inc(r);if r>=1000000 then r:=1;
							q[r]:=b;v[b]:=true;
						end;
					if (d[b]<key)and(f[b]) then begin dec(ans);f[b]:=false;end;
				end;
			ege:=next[ege];
		end;
	until l>r;
end;
begin
	readln(n,m,a,key);
	for I:=1 to m do
		begin
			readln(x,y,z);
			add(x,y,z);add(y,x,z);
		end;
	fillchar(d,sizeof(d),$3f);readln(x);spfa(x);
	for i:=1 to n do if d[i]>=key then begin inc(ans);f[i]:=true;end;writeln(ans);
	for i:=2 to a do
		begin
			readln(x);
			Spfa(x);
			writeln(ans);
		end;
end.

