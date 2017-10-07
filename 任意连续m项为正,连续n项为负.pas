var
	i,j,n,m:longint;
	e,ed,next,head:array[-1..400000]of longint;
	//a,b,e:array[0..400000]of longint;
	d,t:array[-1..400000]of longint;
	tot:longint;
	nn:longint;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;
	e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure spfa;
var
	vis:array[-1..100000]of boolean;
	k,b,ege:longint;
	q:array[0..300000]of longint;
	l,r:longint;
begin
	fillchar(vis,sizeof(vis),0);vis[-1]:=true;
	q[1]:=-1;l:=0;r:=1;
	repeat
		inc(l);if l>=300000 then l:=1;
		k:=q[l];
		ege:=head[k];vis[k]:=false;
		while ege<>0 do
			begin
				b:=ed[ege];
				if d[k]+e[ege]<d[b] then
					begin
						d[b]:=d[k]+e[ege];
						if not vis[b] then
							begin
								vis[b]:=true;
								inc(r);if r>=300000 then r:=1;
								q[r]:=b;
                            end;
                    end;
				ege:=next[ege];
            end;
	until l=r;
end;
{procedure add(x,y,z:longint);
begin
	inc(tot);
	a[tot]:=x;b[tot]:=y;e[tot]:=z;
end;
function bellman:boolean;
var
	i,j:longint;
	flag:boolean;
begin
	d:=t;
    fillchar(t,sizeof(t),$3f);t[-1]:=0;
	for i:=-1 to nn do
		begin
			flag:=false;
			for j:=1 to tot do
					if t[a[j]]+e[j]<t[b[j]] then
						begin
							flag:=true;
							t[b[j]]:=t[a[j]]+e[j];
		                end;
			if not flag then exit(true);
        end;
	exit(false);
end;}
begin
	readln(m,n);

	//nn:=n;if nn<m then nn:=m;
	nn:=N+m-2;

	if (nn<=0)or(n=1)or(m=1) then begin writeln('NONE');halt;end;
	fillchar(d,sizeof(d),$3f);d[-1]:=0;
	for i:=0 to nn-n do add(i,i+n,-1);
	for i:=m to nn do add(i,i-m,-1);
	for i:=0 to nn do add(-1,i,0);
	spfa;
//	for i:=0 to nn do write(d[i],' ');writeln;
{	while nn<n+m do
		if bellman then
			begin
				inc(nn);writeln('now=',nn);
				add(-1,nn,0);
				add(nn,nn-m,-1);
				add(nn-n,nn,-1);
            end
		else
			begin
				dec(nn);
                break;
			end;}
    writeln(nn);
	for i:=1 to nn-1 do
		write(d[i]-d[i-1],' ');
	writeln(d[nn]-d[nn-1]);
end.

