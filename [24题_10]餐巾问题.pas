const
	inf=1 shl 30;
var
	ed,e,head,next,c:array[0..20001]of longint;
	i,n,p,a,f,b,g,ans,s,t,tp,minc:longint;
	d,rr,pre:array[0..3001]of longint;
	q:array[0..10001]of longint;
	l,r,tot:longint;
	vis:array[0..2001]of boolean;
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
	k,b,ege:longint;
begin
	for i:=0 to t do
		begin
			write(i);
			ege:=head[i];
			while ege<>0 do
				begin
					if c[ege]=0 then begin ege:=next[ege];continue;end;
					write('->',ed[ege]);
					ege:=next[ege];
                end;
			writeln;
        end;
end;
function spfa:boolean;
var
	k,b,ege:longint;
begin
	fillchar(d,sizeof(d),$7f);d[s]:=0;
	fillchar(vis,sizeof(vis),0);vis[s]:=true;
	l:=0;r:=1;q[1]:=s;
	repeat
		inc(l);if l>=10000 then l:=1;
		k:=q[l];vis[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				if c[ege]>0 then
					begin
						b:=ed[ege];
						if d[k]+e[ege]<d[b] then
							begin
								d[b]:=d[k]+e[ege];pre[b]:=ege;
								if not vis[b] then
									begin
										inc(r);if r>=10000 then r:=1;
										q[r]:=b;vis[b]:=true;
              	     	         end;
              	    	  end;
					end;
				ege:=next[ege];
            end;
	until l=r;
	exit(d[t]<d[t+1]);
end;
begin
	assign(input,'napk.in');reset(input);assign(output,'napk.out');rewrite(output);
	readln(n,p,a,f,b,g);
    tot:=1;//千万别忘记！！！
	for i:=1 to n do
		readln(rr[i]);
	s:=0;t:=2*n+1;
	for i:=1 to n do
		begin
			add(s,i,rr[i],p);//也可以容量inf,费用p
			add(s,i+n,rr[i],0);
			if i+a<=n then add(i+n,i+a,inf,f);
            if i+b<=n then add(i+n,i+b,inf,g);
            add(i,t,rr[i],0);
            if i+1+n<=2*n then add(i+n,i+n+1,inf,0);
		end;
{
建图的说明：
首先应当把每天拆成两个点（i,i+n），如果不拆点的话，因为题目中会出现第i天的旧餐巾可以留到以后洗，而一旦留到以后洗，将无法区别新餐巾与旧餐巾，
也就是这是以前留下的旧餐巾现在也可以当新餐巾使用了，这是不合法的，因此应当 且 必须拆点，将新餐巾与旧餐巾分开处理；
<容量,费用>::
1、从s向i点连边，容量可以为任意，即为无穷大(或者上限为rr[i]),因为可以买任意多个餐巾(或者说最多买rr[i]个，因为没必要买多了,用不完~),费用为p
2、从s向i+n连 <rr[i],0>的边，因为每天最多只有rr[i]个餐巾用完,不会多于rr[i]，费用为0
3、从i+n向i+a连<inf,f>的边，因为第i+a天的餐巾有两个来源，
  一是购买(即1)，二是第i天送快洗部后，将在a天之后送到第i+a天，至于容量为什么是inf而不是rr[i],就要好好想一想了，因为第i天留下的餐巾不仅可以
  送进快洗部，还可以留到下一天，这样可能会有n多天留下的衣服堆积在一起，一起送进快洗部，因此是inf，费用即为送进快洗部的费用f；
4、从i+n向i+b连<inf,g>的边，理由与3类似；
5、从i向t连<rr[i],0>的边，要在这里保证第i天只有rr[i]个餐巾流出(即 用完)，费用是0；
6、从i+n向i+n+1连<inf,0>的边，这里即要满足第i天留下的衣服可以留到第i+1天，这里的容量还是因为不仅是第i天的衣服留了下来，还有以前留下的，所以
  应为inf，费用为0
}
    //print;
	while spfa do
		begin
			tp:=t;minc:=inf;
			while tp<>s do
				begin
					if c[pre[tp]]<minc then minc:=c[pre[tp]];
					tp:=ed[pre[tp]xor 1];
				end;
			//writeln('minp ',d[t],' mc=',minc);
			tp:=t;
			while tp<>s do
				begin
					dec(c[pre[tp]],minc);inc(c[pre[tp] xor 1],minc);
					inc(ans,minc*e[pre[tp]]);
                    tp:=ed[pre[tp]xor 1];
				end;
  			fillchar(pre,sizeof(pre),0);
        end;
	writeln(ans);close(output);
end.

