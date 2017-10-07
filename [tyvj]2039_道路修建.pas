var
	i,j,n,m,x,y,z:longint;
	sum,e:array[0..500001]of qword;
	cost:array[0..500001]of qword;
	v:array[0..500001]of boolean;
	tot:longint;
    ans1,ans2,p:qword;
	q:array[0..1000001]of longint;
	ed,head,next:array[0..505001]of longint;
function dfs(x:qword):qword;
var
	b,ege:longint;
begin
	ege:=head[x];v[x]:=true;
	while ege<>0 do
		begin
			b:=ed[ege];
			if not v[b] then begin
				sum[b]:=dfs(b);
				sum[x]:=sum[x]+sum[b];
				cost[1]:=cost[1]+sum[b]*e[ege];
			end;
			ege:=next[ege];
        end;
    sum[x]:=sum[x]+1;
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
		inc(l);if l>=1000000 then l:=1;
		k:=q[l];
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				if not v[b] then
                	begin
                        cost[b]:=cost[k]+int64((sum[1]-sum[b]))*e[ege]-int64(sum[b]*e[ege]);
                        inc(r);if r>=1000000 then r:=1;
                        q[r]:=b;v[b]:=true;
                    end;
				ege:=next[ege];
			end;
	until l=r;
end;
function gcd(a,b:qword):qword;
begin
	if b=0 then exit(a);
	exit(gcd(b,a mod b));
end;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
begin
	//assign(input,'1.in');reset(input);assign(output,'1.out');rewrite(output);
	readln(n);
	for i:=1 to n-1 do
		begin
			readln(x,y,z);
			add(x,y,z);add(y,x,z);
        end;
	dfs(1);
    //writeln('>>',cost[1]);
    bfs;		//for i:=1 to n do writeln(i,' : ',cost[i],' ',sum[i]);
	for i:=1 to n do ans1:=ans1+cost[i];
	ans1:=ans1 div 2;
    ans2:=int64(n)*int64((n-1)) div 2;
	p:=gcd(ans1,ans2);
	writeln(ans1 div p,'/',ans2 div p);
end.

