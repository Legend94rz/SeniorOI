type
	node=record
		step,no:longint;
		end;
var
	i,j,k,n,m,sx,sy,tx,ty,tk,ans:Longint;
	head,ed,e,next:array[0..400001]of longint;
	tot:longint;
	a:array[0..201,0..201]of longint;
	v:array[0..201,0..50001]of boolean;
	d:array[0..201,0..50001]of longint;
	q:array[0..200001]of node;
procedure add(x,y,z:Longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure bfs;
var
	l,r,ege,b:longint;
	k:node;
begin
	fillchar(v,sizeof(v),0);v[0,q[r].no]:=true;
    l:=0;r:=1;q[r].no:=(sx-1)*m+sy;
    d[0,q[r].no]:=0;q[r].step:=0;
	repeat
		inc(l);if l>=200000 then l:=1;
		k:=q[l];ege:=head[k.no];
		while ege<>0 do
			begin
				b:=ed[ege];
				if d[k.step,k.no]+e[ege]>d[k.step+1,b] then
					begin
						d[k.step+1,b]:=d[k.step,k.no]+e[ege];
						if (not v[k.step+1,b])and(k.step<tk) then
							begin
								inc(r);if r>=200000 then r:=1;
                                q[r].no:=b;q[r].step:=k.step+1;
								v[k.step+1,b]:=true;
							end;
                    end;
				ege:=next[ege];
            end;
	until l=r;
end;
begin
	readln(n,m,tk);//filldword(d,sizeof(d)shr 2,-maxlongint shr 1);
	readln(sx,sy,tx,ty);
	for i:=0 to 201 do for j:=0 to n*m do d[i,j]:=-maxlongint;
	for i:=1 to n do
		begin
			for j:=1 to m do read(a[i,j]);
			readln;
		end;
	for i:=1 to n do
		for j:=1 to m do
			if a[i,j]<>0 then
				begin
					if (i>1)and(a[i-1,j]<>0) then add((i-1)*m+j,(i-2)*m+j,a[i-1,j]);
					if (i<n)and(a[i+1,j]<>0) then add((i-1)*m+j,i*m+j,a[i+1,j]);
					if (j>1)and(a[i,j-1]<>0) then add((i-1)*m+j,(i-1)*m+j-1,a[i,j-1]);
					if (j<m)and(a[i,j+1]<>0) then add((i-1)*m+j,(i-1)*m+j+1,a[i,j+1]);
	            end;
	bfs;ans:=-maxlongint;
	for i:=1 to tk do
		if d[i,(tx-1)*m+ty]>ans then
			ans:=d[i,(tx-1)*m+ty];
	if ans>-maxlongint then
		writeln(ans)
	else
		writeln('Cannot can''t!');
end.


