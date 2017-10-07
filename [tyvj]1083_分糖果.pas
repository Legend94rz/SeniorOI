var
	key,i,j,n,m,tot,c,x,y,ans:longint;
	next,head,ed:array[0..4000001]of longint;
	v:array[0..100001]of boolean;
	q,d:array[0..100001]of longint;
procedure bfs(s:longint);
var
	i,j,k,b,ege:longint;
	l,r:longint;
begin
	l:=0;r:=1;q[r]:=s;v[s]:=true;fillchar(d,sizeof(d),$3f);
    d[s]:=0;
	repeat
		inc(l);if l>=100000 then l:=1;
		k:=q[l];v[k]:=false;
		ege:=head[k];//write(k);
		while ege<>0 do
			begin
				b:=ed[ege];//write('->',b);
				if d[k]+1<d[b] then
					begin
						d[b]:=1+d[k];
						if d[b]>ans then ans:=d[b];
						if not v[b] then
							begin
								inc(r);if r>=100000 then r:=1;
								q[r]:=b;v[b]:=true;
                            end;
                    end;
				ege:=next[ege];
            end;
		//writeln;
	until l=r;
	writeln(ans+key);
end;
procedure add(x,y:longint);
begin
	//writeln('>',x,'->',y);
	inc(tot);
	ed[tot]:=y;
	next[tot]:=head[x];
	head[x]:=tot;
end;
begin
	readln(n,m,c);
	readln(key);
	for i:=1 to m do
		begin
			readln(x,y);
			add(x,y);add(y,x);
        end;
	add(0,c);
	bfs(0);
end.

