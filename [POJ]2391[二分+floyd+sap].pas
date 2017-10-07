const
	inf=99999999999999;
var
	i,j,n,m:longint;
	next,ed,e,head,te,thead:array[0..85001]of longint;
	s,t,x,y,z,nn:longint;
	tot,sum,ttot:longint;
	p:array[0..500,0..500]of int64;
	a,b,h,vh:array[0..500]of longint;
	flow,tmp,l,r,mid:int64;
function min(a,b:int64):int64;
begin
	if a<b then exit(a);
	exit(b);
end;
procedure add(x,y,z:longint);
begin
	inc(tot);
    ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
	inc(tot);
	ed[tot]:=x;e[tot]:=0;
	next[tot]:=head[y];
	head[y]:=tot;
end;
procedure floyd;
var
	i,j,k:longint;
begin
    fillDword(p,sizeof(p)shr 2,inf);//最好用fillDword
    for i:=1 to m do
		begin
	        readln(x,y,z);
			p[x,y]:=min(p[x,y],z);p[y,x]:=p[x,y];
		end;
    for i:=1 to n do p[i,i]:=0;
	for k:=1 to n do
		for i:=1 to n do
			for j:=1 to n do
				p[i,j]:=min(p[i,j],p[i,k]+p[k,j]);
end;
function sap(m:longint;f:int64):int64;
var
	k,b,ege,minh:longint;
	rest:int64;
begin
	//writeln('sap ',m,' ',f);
	if m=t then exit(f);
	minh:=nn-1;rest:=f;
	ege:=head[m];
	while ege<>0 do
		begin
			b:=ed[ege];
            //{静态图时的判断}if p[m,b]>mid then begin {writeln('skip occur at ',m,' ',b,' path:',p[m,b],'c:',e[ege]);}ege:=next[ege];continue;end;
			if e[ege]>0 then
				begin
					if h[b]+1=h[m] then
						begin
							k:=sap(b,min(rest,e[ege]));
							dec(e[ege],k);inc(e[ege xor 1],k);dec(rest,k);
							if h[s]>=nn then exit(f-rest);
                        end;
					if h[b]<minh then minh:=h[b];if rest=0 then break;
				end;
			ege:=next[ege];
        end;
	if rest=f then
		begin
			dec(vh[h[m]]);
			if vh[h[m]]=0 then h[s]:=nn;
			h[m]:=minh+1;
			inc(vh[h[m]]);
		end;
	exit(f-rest);
end;
procedure print;
var
	k,b,ege,i:longint;
begin
	for i:=0 to t do
		begin
			write(i);
			ege:=head[i];
			while ege<>0 do
				begin
					if e[ege]=0 then begin ege:=next[ege];continue;end;
					write('->',ed[ege]);
					ege:=next[ege];
                end;
			writeln;
        end;
end;
begin
	readln(n,m);tot:=1;s:=0;t:=2*n+1;nn:=t+1;
	for i:=1 to n do//初始只连左右边
		begin
            readln(a[i],b[i]);inc(sum,a[i]);
            if a[i]>0 then add(s,i,a[i]);
            if b[i]>0 then add(i+n,t,b[i]);
        end;
    {for i:=1 to n do
		for j:=n+1 to n+n do
			add(i,j,inf);}//这里还是不要建静态图了。。超时
	//print;
	floyd;
    for i:=1 to n do//必要
        begin
            p[0,i]:=0;p[i,0]:=0;
            for j:=1+n to n+n do
				begin
					p[i,j]:=p[i,j-n];
					p[j,i]:=p[i,j];p[j,t]:=0;p[t,j]:=0;
                end;
        end;
	{for i:=1 to n do
		for j:=1 to n do
			writeln(i,' ',j,' ',p[i,j]);}//out floyd
	l:=0;r:=200000000001;//上界应小于inf 的 200（f max） 倍
	repeat
        fillchar(h,sizeof(h),0);fillchar(vh,sizeof(vh),0);vh[0]:=nn;flow:=0;
        te:=e;  thead:=head;ttot:=tot;//保存网络骨架以及head，tot，
        							//注意head不能开得太大，保存数组的复杂度为O(n)!!!
        mid:=(l+r) shr 1;
    	for i:=1 to n do//动态添加
			for j:=n+1 to n+n do
				if p[i,j]<mid then
					add(i,j,inf);
        while h[s]<nn do inc(flow,sap(s,inf));
		//writeln(mid,' ',flow);
		if flow>=sum then
			r:=mid-1
		else
			l:=mid+1;
		e:=te;  head:=thead;tot:=ttot;//还原，以便下次二分时的动态添边
	until l>r;
	if (r=200000000001) then r:=-1;
	writeln({l,' ',mid,' ',}r);
end.

