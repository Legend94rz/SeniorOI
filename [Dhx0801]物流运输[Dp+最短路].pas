var
	i,j,n,m,day,p,x,y,z,w,key,tot:longint;
	d,f:array[0..1001]of longint;
	q,e,ed,next,head:array[0..10001]of longint;
	time:array[0..101,0..101]of boolean;
	v:array[0..1001]of boolean;
function min(a,b:Longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
function check(b,st,ed:longint):boolean;
var
	i:longint;
begin
	for i:=st to ed do
		if not time[b,i] then
			exit(false);
	exit(true);
end;
function spfa(x,y:longint):longint;
var
	k,b,ege:Longint;
	l,r:longint;
begin
	fillchar(v,sizeof(v),0);v[1]:=true;
	l:=0;r:=1;q[r]:=1;
	fillchar(d,sizeof(d),$3f);d[1]:=0;
	repeat
		inc(l);if l>=10000 then l:=1;
		k:=q[l];v[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				if (d[k]+e[ege]<d[b])and(check(b,x,y)) then
					begin
						d[b]:=d[k]+e[ege];
						if not v[b] then
							begin
								inc(r);if r>=10000 then r:=1;
								q[r]:=b;v[b]:=true;
                            end;
                    end;
				ege:=next[ege];
            end;
	until l=r;
	exit(d[n]);
end;
procedure add(x,y,z:Longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
begin
	assign(input,'1.in');reset(input);assign(output,'1.out');rewrite(output);
	readln(day,n,key,m);
	for i:=1 to m do
		begin
			readln(x,y,z);
			add(x,y,z);add(y,x,z);
        end;
	readln(p);
    fillchar(f,sizeof(f),$3f);f[0]:=0;fillchar(time,sizeof(time),1);
	for i:=1 to p do
		begin
			readln(x,z,w);
			for j:=z to w do time[x,j]:=false;
        end;
	for i:=1 to day do
		for j:=0 to i-1 do
			begin
				x:=spfa(j+1,i);//writeln('>>',j+1,'-',i,' ',x);
				if x<>$3f3f3f3f then
					f[i]:=min(f[i],f[j]+x*(i-j)+key);
            end;
	writeln(f[day]-key);
	close(output);
end.

