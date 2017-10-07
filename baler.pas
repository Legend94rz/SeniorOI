var
	i,j,n,m,xn,yn:longint;
	ed,e,head,next:array[0..400001]of longint;
	x,y,pre:array[0..1500]of longint;
	zs,bj:array[0..1500]of double;
	znum,snum,tot:longint;
	d,ans:double;
	vis:array[0..1500]of boolean;
	q:array[0..200001]of longint;
procedure bfs;
var
	l,r:longint;
	k,b,ege:longint;
	flag:boolean;
begin
	l:=0;r:=1;q[r]:=snum;flag:=false;
	repeat
		inc(l);if l>=200000 then l:=1;
		k:=q[l];vis[k]:=true;
		ege:=head[k];
		while ege>0 do
			begin
				b:=ed[ege];//writeln('b:',b);
				if not vis[b] then
					begiN
						zs[b]:=-zs[k]*bj[k]/bj[b];
						inc(r);if r>=200001 then r:=1;
						q[r]:=b;pre[b]:=k;
						if b=znum then begin flag:=true;break;end;
                    end;
				ege:=next[ege];
            end;
		if flag then break;
	until l=r;
	k:=znum;ans:=0;
	while k<>-1 do
		begin
			ans:=ans+abs(zs[k]);
			//writeln('at',k);
			k:=pre[k];
        end;
	writeln(ans:0:0);
end;
procedure add(x,y:longint);
begin
	inc(tot);
	ed[tot]:=y;
	next[tot]:=head[x];
	head[x]:=tot;
end;
begin
	assign(input,'baler.in');reset(input);assign(output,'baler.out');rewrite(output);
	readln(n,xn,yn);
	for i:=1 to n do
		begin
			readln(x[i],y[i],bj[i]);
			if (x[i]=0)and(y[i]=0) then snum:=i;
			if (x[i]=xn)and(y[i]=yn) then znum:=i;
        end;
	zs[snum]:=10000;pre[snum]:=-1;
	for i:=2 to n do
		for j:=1 to i-1 do
			begin
				d:=sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j]));
				if abs(bj[i]+bj[j]-d)<=0.00001 then
					begin
						add(i,j);add(j,i);
						//writeln('add ',i,' ',j);
					end;
            end;
	bfs;
	close(output);
end.

