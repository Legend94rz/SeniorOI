var
	i,j,n,m:longint;
	tot,x,y,z:longint;
	head,ed,e,next:array[0..400001]of longint;
	w,d:array[0..1000]of longint;
	v:array[0..1001]of boolean;
	q:array[0..20001]of longint;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure spfa;
var
	l,r,k,b,ege:longint;
begin
	fillchar(v,sizeof(v),0);v[0]:=true;l:=0;r:=1;q[r]:=0;
	fillchar(d,sizeof(d),$3f);d[0]:=0;
	repeat
		inc(l);if l>=20000 then l:=1;
		k:=q[l];v[k]:=false;
		ege:=head[k];//write(k);
		while ege<>0 do
			begin
				b:=ed[ege];//write('->',b,':',e[ege]);
				if d[k]+e[ege]<d[b] then
					begin
						d[b]:=e[ege]+d[k];
						if not v[b] then begin
							inc(r);if r>=20000 then r:=1;
							q[r]:=b;v[b]:=true;
                        end;

                    end;
				ege:=next[ege];
			end;
		//writeln;
	until l=r;
	if d[n+1]=$3f3f3f3f then
		writeln(-1)
	else
		writeln(d[n+1]);
end;
begin
	readln(n,m);
	for i:=1 to n do readln(w[i]);add(0,1,w[1]);
	for i:=1 to m do
		begin
			readln(x,y,z);
			if (y=1)and(x<>1) then
                add(x,n+1,z)
			else
                add(x,y,z+w[y]);
        end;
	spfa;
end.

