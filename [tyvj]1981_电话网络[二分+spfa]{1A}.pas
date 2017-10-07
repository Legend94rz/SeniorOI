var
	i,j,n,m,k,x,y,z:longint;
	head,ed,e,next:array[0..1000001]of longint;
	tot,key:longint;
	l,r,mid:longint;
	q,d:array[0..10001]of longint;
	v:array[0..1001]of boolean;
	len:array[false..true]of longint=(0,1);
function spfa(std:longint):boolean;
var
	k,b,ege:longint;
	l,r:longint;
begin
	l:=0;r:=1;q[r]:=1;
	fillchar(d,sizeof(d),$3f);d[1]:=0;
	fillchar(v,sizeof(v),0);v[1]:=true;
	repeat
		inc(l);if l>=100000 then l:=1;
		k:=q[l];v[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				if d[k]+len[e[ege]>std]<d[b] then
					begin
						d[b]:=d[k]+len[e[ege]>std];
						if not v[b] then
							begin
								inc(r);if r>=100000 then r:=1;
								q[r]:=b;v[b]:=true;
                            end;
                    end;
                ege:=next[ege];
            end;
	until l=r;
	exit(d[n]<=key);
end;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
begin
	readln(n,m,key);
	for i:=1 to m do
		begin
			readln(x,y,z);
			add(x,y,z);add(y,x,z);
        end;
	l:=0;r:=2000000;
	repeat
		mid:=(l+r)shr 1;
		if spfa(mid) then
			r:=mid-1
		else
			l:=mid+1;
	until l>r;
	if l<=2000000 then
	    writeln(l)
	else
		writeln(-1);
end.

