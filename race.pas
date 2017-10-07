program race;
var
	vis:array[0..100005]of boolean;
	i,j,n,m:longint;
	a:array[0..100005,1..3]of longint;
	e,next,head,ed:array[0..4000005]of longint;
	tot:longint;
	d:array[0..100000]of double;
procedure qsort(s,t:longint;ct:byte);
var
	i,j:longint;
	y,k:array[1..3]of longint;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1];
	repeat
		while (a[j,ct]>k[ct])or(a[j,ct]=k[ct])and(a[j,3-ct]>k[3-ct]) do dec(j);
		while (a[i,ct]<k[ct])or(a[i,ct]=k[ct])and(a[i,3-ct]<k[3-ct]) do inc(I);
		if i<=j then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				dec(j);inc(i);
			End;
	Until i>j;
	if (s<j) then qsort(s,j,ct);
	if (i<t) then qsort(i,t,ct);
End;

procedure spfa;
var
	i,j:longint;
	ege,k,link:longint;
	q:array[0..1000000]of longint;
	l,r:longint;
begin
	for i:=1 to n do d[i]:=999999999999;
	r:=1;q[r]:=0;l:=0;
	repeat
		inc(l);
		k:=q[l];
		ege:=head[k];
		vis[k]:=false;
		while ege<>0 do
			begin
				link:=ed[ege];
				if d[k]+e[ege]<d[link] then
					begin
						d[link]:=d[k]+e[ege];
						if not vis[link] then
							begin
								inc(r);
								q[r]:=link;
								vis[link]:=true;
							end;
					end;
				ege:=next[ege];
			end;
	until l>=r;
end;
procedure add(x,y,w:longint);
begin
	inc(tot);
	ed[tot]:=y;
	e[tot]:=w;
	next[tot]:=head[x];
	head[x]:=tot;
end;
begin
	assign(input,'race.in');reset(input);assign(output,'race.out');rewrite(output);
	readln(n);
	for i:=0 to n+1 do
		begin
			readln(a[i,1],a[i,2]);
			a[i,3]:=i;
		End;
	inc(n);
	//writeln('sort by x:');
	qsort(0,n,1);
	for i:=1 to n do
		begin
			if a[i,1]=a[i-1,1] then
				begin
					add(a[i-1,3],a[i,3],abs(a[i,2]-a[i-1,2]));
					add(a[i,3],a[i-1,3],abs(a[i,2]-a[i-1,2]));
					//writeln('will add ',a[i,3],' and ',a[i-1,3]);
				end;
		end;
	{for i:=0 to n do
		writelN(a[i,3],' ',a[i,1],' ',a[i,2]);
	writeln('-----finished-----');
	writeln('sort by y:');}
	qsort(0,n,2);
	for i:=1 to n do
		if a[i,2]=a[i-1,2] then
			begin
				add(a[i-1,3],a[i,3],abs(a[i,1]-a[i-1,1]));
				add(a[i,3],a[i-1,3],abs(a[i,1]-a[i-1,1]));
				//writeln('will add ',a[i,3],' and ',a[i-1,3]);
			end;
	{for i:=0 to n do
		writelN(a[i,3],' ',a[i,1],' ',a[i,2]);
	writeln('-------finished-----');
	writeln('has ',tot,' edges.');}
	spfa;
	if d[i]<>999999999999 then
		writeln(d[i]:0:3{,' ',i})
	else
		writeln('NO');
	close(output);
end.
