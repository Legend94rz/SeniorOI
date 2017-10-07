{
warnning!!!
此题特别注意要用int64，上界要开大，又加又乘的东西可不是Longint能存下的~~~
}
var
	i,j,n,m,x,y,z:longint;
	a,sum:array[0..500001]of int64;
	cost:array[0..500001]of int64;
	v:array[0..500001]of boolean;
	tot:longint;
    ans1,ans2:int64;
	q,d:array[0..100001]of longint;
	ed,e,head,next:array[0..405001]of longint;
function dfs(x:longint):int64;
var
	b,ege:longint;
begin
	ege:=head[x];v[x]:=true;
	while ege<>0 do
		begin
			b:=ed[ege];
			if not v[b] then begin
				sum[b]:=dfs(b);
				cost[x]:=cost[x]+sum[b]*e[ege]+cost[b];
				inc(sum[x],sum[b]);
			end;
			ege:=next[ege];
        end;
	sum[x]:=sum[x]+a[x];
	exit(sum[x]);
end;
procedure bfs;
var
	k,b,ege:longint;
	l,r:longint;
begin
	l:=0;r:=1;q[r]:=1;
    fillchar(v,sizeof(v),0);v[1]:=true;
	repeat
		inc(l);if l>=100000 then l:=1;
		k:=q[l];
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				if not v[b] then
                	begin
                        cost[b]:=cost[k]+(sum[1]-sum[b])*e[ege]-sum[b]*e[ege];
                        inc(r);if r>=100000 then r:=1;
                        q[r]:=b;v[b]:=true;
                    end;
				ege:=next[ege];
			end;
	until l=r;
end;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
begin
	assign(input,'1.in');reset(input);assign(output,'1.out');rewrite(output);
	readln(n);
	for i:=1 to n do read(a[i]);
	for i:=1 to n-1 do
		begin
			readln(x,y,z);
			add(x,y,z);add(y,x,z);
        end;
	dfs(1);		//writeln('>>',cost[1]);
    bfs;		//for i:=1 to n do writeln(i,' : ',cost[i],' ',sum[i]);
	ans2:=99999999999999;//上界要特别大
	for i:=1 to n do if cost[i]<ans2 then begin ans2:=cost[i];ans1:=i;end;
	writeln(ans1);
	writeln(ans2);
	close(output);
end.

