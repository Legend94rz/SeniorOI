var
	i,j,n,m,ctrl:Longint;
	e,ed,next,head:array[0..200001]of longint;
	tot,x,y,z:longint;
	d:array[0..10001,1..2]of longint;
	v:array[0..10001]of boolean;
	q:array[0..100001]of longint;
	l,r:longint;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure spfa;
var
	k,b,ege,i:longint;
	procedure inq(b:longint);
		begin
			if not v[b] then
				begin
					inc(r);if r>=100000 then r:=1;
					q[r]:=b;v[b]:=true;
				end;
        end;
begin
	inc(r);q[r]:=1;
	fillchar(d,sizeof(d),$3f);d[1,1]:=0;
	fillchar(v,sizeof(v),0);v[1]:=true;
	repeat
		inc(l);if l>=100000 then l:=1;
		k:=q[l];v[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				for i:=1 to 2 do
					if d[k,i]+e[ege]<=d[b,1] then
						begin
							if d[k,i]+e[ege]<d[b,1] then d[b,2]:=d[b,1];
                            d[b,1]:=d[k,i]+e[ege];
                            inq(b);
                    	end
					else
						if d[k,i]+e[ege]<d[b,2] then
							begin
								d[b,2]:=d[k,i]+e[ege];
								inq(b);
							end;
				ege:=next[ege];
            end;
    until l=r;
end;
begin
	readln(n,m);
	for I:=1 to m do
		begin
			readln(x,y,z);
			add(x,y,z);add(y,x,z);
		end;
	readln(ctrl);
	spfa;
	if ctrl=0 then
		writeln(d[n,1])
	else
		writeln(d[n,2]);
end.

