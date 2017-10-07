var
	i,j,n,m:Longint;
	x,y,z,ans,num,total:longint;
	tot:longint;
    rea:array[0..100001]of boolean;
	ind,a:array[0..100001]of longint;
	head,ed,next:array[0..300001]of longint;
	inf:array[0..201,0..201]of longint;
procedure topsort;
var
	q:array[0..100001]of longint;
	l,r,k,b,ege,i:longint;
	v:array[0..100001]of boolean;
begin
	fillchar(v,sizeof(v),0);r:=0;
	fillchar(q,sizeof(q),0);
	for i:=1 to n do
		if (ind[a[i]]=0) then
			begin
				inc(r);inc(num);
                q[r]:=i;
                v[i]:=true;
			end;
	if r=0 then begin writeln(n);halt;end;
	l:=0;
	repeat
		inc(l);if l>=100000 then l:=1;
		k:=q[l];
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				dec(ind[b]);
				if (not v[b])and(ind[b]=0) then
					begin
						inc(r);if r>=100000 then r:=1;
						q[r]:=b;v[b]:=true;inc(num);
					end;
				ege:=next[ege];
            end;
	until l=r;
end;
procedure add(x,y:Longint);
begin
	inc(tot);
	ed[tot]:=y;inc(ind[y]);
	next[tot]:=head[x];
	head[x]:=tot;
end;
begin
//	assign(input,'4.txt');reset(input);
	readln(n);
	for i:=1 to n do
		begin
			read(x,y);rea[x]:=true;inf[i,0]:=y;a[i]:=x;
			for j:=1 to y do
				begin
	                read(z);inf[i,j]:=z;
				end;
        end;
	for i:=1 to n do
		for j:=1 to inf[i,0] do
			if rea[inf[i,j]] then
            	add(i,inf[i,j]);
	topsort;
	if num=n then
		writeln('YES')
	else
		writeln(n-num);
end.

