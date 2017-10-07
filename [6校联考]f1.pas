var
	i,j,n,m,x,y,z,s,t,k,cas,u:Longint;
	next,head,ed:array[0..500001]of longint;
	have:array[0..100001]of boolean;
	tot:longint;
	l,r,mid:longint;
	q,d:array[0..150001]of longint;
	v:array[0..100001]of boolean;
procedure spfa;
var
	k,b,ege:longint;
	l,r,i:longint;
begin
	l:=0;r:=1;q[r]:=s;
	fillchar(d,sizeof(d),$80);d[s]:=mid;
	fillchar(v,sizeof(v),0);v[s]:=true;
	repeat
		inc(l);if l>=150000 then L:=1;
		k:=q[l];v[k]:=false;
		ege:=head[k];//write(k);
		while ege<>0 do
			begin
				b:=ed[ege];//write('->',b);
				if (d[k]-1>d[b])and(d[k]-1>=0) then
					begin
						d[b]:=d[k]-1;
						if have[b] then d[b]:=mid;//write(' ',d[b]);
						if not v[b]then begin
							inc(r);if r>=150000 then r:=1;
							q[r]:=b;v[b]:=true;
						end;
                    end;
				ege:=next[ege];
            end;
		//writeln;
	until l=r;
end;
procedure add(x,y:Longint);
begin
	if (x=y) then exit;
	inc(tot);
	ed[tot]:=y;
	next[tot]:=head[x];
	head[x]:=tot;
end;
begin
	assign(input,'f1.in');reset(input);assign(output,'f1.out');rewrite(output);
	readln(cas);
	for u:=1 to cas do begin
		fillchar(head,sizeof(head),0);tot:=0;
		fillchar(have,sizeof(have),0);
		readln(n,m,k);
		for I:=1 to k do begin read(x);have[x]:=true;end;
		for I:=1 to m do
			begin
				readln(x,y);
				add(x,y);add(y,x);
			end;
		readln(s,t);
		l:=1;r:=m;
		repeat
			mid:=(l+r) shr 1;
			spfa;//writeln('>>>>',d[s]);
			if d[t]>=0 then
				r:=mid-1
			else
				l:=mid+1;
		until l>r ;
		if l<=m then writeln(l) else writeln(-1);
	end;
	close(output);
end.

