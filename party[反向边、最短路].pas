var
	i,j,n,m,s,x,y,z:longint;
	tot,ans:longint;
	head,ed,e,next:array[0..1000001]of longint;
	flag:array[0..1000001]of byte;//1-正向;0-反向
	d:array[0..1,0..20000]of longint;
	q:array[0..100001]of longint;
	v:array[0..20001]of boolean;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;flag[tot]:=1;
	next[tot]:=head[x];
	head[x]:=tot;
	inc(tot);
	ed[tot]:=x;e[tot]:=z;flag[tot]:=0;
	next[tot]:=head[y];
	head[y]:=tot;
end;
procedure spfa(c:longint);
var
	l,r,k,b,ege:longint;
begin
	l:=0;r:=1;q[r]:=s;fillchar(d[c],sizeof(d[c]),$3f);d[c,s]:=0;
	fillchar(v,sizeof(v),0);v[s]:=true;
	repeat
		inc(l);if l>=100000 then l:=1;
		k:=q[l];v[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				if flag[ege]<>c then begin ege:=next[ege];continue;end;
				b:=ed[ege];
				if d[c,k]+e[ege]<d[c,b] then
					begin
						d[c,b]:=d[c,k]+e[ege];
						if not v[b] then
							begin
								inc(r);if r>=100000 then r:=1;
								q[r]:=b;v[b]:=true;
                            end;
                    end;
				ege:=next[ege];
            end;
	until l=r;
end;
begin
	assign(input,'party.in');reset(input);assign(output,'party.out');rewrite(output);
	readln(n,m,s);
	for i:=1 to m do
		begin
		    readln(x,y,z);
			add(x,y,z);
		end;
	spfa(1);
	spfa(0);
	for i:=1 to n do
		if d[0,i]+d[1,i]>ans then
			ans:=d[0,i]+d[1,i];
	writeln(ans);
	close(output);
end.

