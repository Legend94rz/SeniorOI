const
	inf=1 shl 30;
type
	node=record
		d:longint;
		f:boolean;//是左端点此项为TRUE
		end;
var
	tt,i,j,n,m,s,t,u,x,y,g,h:longint;
	head,ed,e,next,c:array[0..2001]of longint;
	q:array[0..2001]of longint;
	tot,nn,tp:longint;
	ans:int64;
	a:array[0..401]of node;
	la:longint;//a的指针
	b,r,pre,d:array[0..1001]of longint;//原数据
	fx:array[0..100001,false..true]of longint;
procedure qsort(s,t:longint);
var
	i,j:longint;
	k,u:node;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1];
	repeat
		while (a[j].d>k.d)or((a[j].d=k.d)and(not k.f)and(a[j].f)) do dec(j);
		while (a[i].d<k.d)or((a[i].d=k.d)and(not a[i].f)and(k.f)) do inc(i);
		if i<=j then
			begin
				u:=a[j];a[j]:=a[i];a[i]:=u;
				dec(j);inc(i);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
function spfa:boolean;
var
	l,r,k,b,ege:longint;
	vis:array[0..1000]of boolean;
begin
	//writeln('-----------');
	fillchar(vis,sizeof(vis),0);vis[s]:=true;
	for i:=1 to t+1 do d[i]:=-270000000;d[s]:=0;
    l:=0;r:=1;q[1]:=s;
	repeat
		inc(l);if l>=2000 then l:=1;//writeln(l,' ',r);
		k:=q[l];vis[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				if c[ege]<=0 then begin ege:=next[ege];continue;end;
				b:=ed[ege];
				if d[k]+e[ege]>d[b] then
					begin
						d[b]:=d[k]+e[ege];
						pre[b]:=ege xor 1;
						if not vis[b] then
							begin
								inc(r);if r>=2000 then r:=1;
								vis[b]:=true;
								q[r]:=b;
                            end;
					end;
				ege:=next[ege];
			end;
	until l=r;
	exit(d[t]>d[t+1]);
end;
procedure add(x,y,z,w:longint);
begin
	inc(tot);
	ed[tot]:=y;c[tot]:=z;e[tot]:=w;
	next[tot]:=head[x];
	head[x]:=tot;
	inc(tot);
	ed[tot]:=x;c[tot]:=0;e[tot]:=-w;
	next[tot]:=head[y];
	head[y]:=tot;
end;
procedure print;
var
	ege,i:longint;
begin
	for i:=0 to t do
		begin
			write(i);
			ege:=head[i];
			while ege<>0 do
				begin
					if c[ege]<=0 then begin ege:=next[ege];continue;end;
					write('->',ed[ege]);
					ege:=next[ege];
                end;
			writeln;
        end;
end;
begin
	readln(tt);
	for u:=1 to tt do
		begin
            readln;
			readln(n,m);
            tot:=1;fillchar(head,sizeof(head),0);nn:=0;la:=0;s:=0;
			for i:=1 to n do
				begin
	                readln(b[i*2-1],b[i*2],r[i]);
					inc(la);a[la].d:=b[i*2-1];a[la].f:=true;
					inc(la);a[la].d:=b[i*2];a[la].f:=false;
				end;
			qsort(1,la);
			for i:=1 to la do
				if (a[i].d<>a[i-1].d)or(a[i].f<>a[i-1].f) then
					begin
						inc(nn);
                   		fx[a[i].d,a[i].f]:=nn;
					end;
            t:=nn+1;
			for i:=1 to n do
				begin
					x:=fx[b[i*2-1],true];y:=fx[b[i*2],false];
					add(x,y,1,r[i]);//容量为1,费用为r[i]
                end;
			add(s,1,m,0);add(nn,t,m,0);
			for i:=1 to nn-1 do add(i,i+1,inf,0);
            //print;
            ans:=0;
			while spfa do
				begin
					tp:=t;inc(ans,d[t]);
					while tp<>s do
						begin
							dec(c[pre[tp]xor 1]);inc(c[pre[tp]]);
							tp:=ed[pre[tp]];
                        end;
				end;
			writeln(ans);
        end;
end.

