var
	i,j,n,m,k,x,y,z:longint;
	head,ed,e,next:array[0..200001]of longint;
	tot,ans:longint;
	a,aim:array[0..5]of longint;
	v:array[1..5]of boolean;
	q:array[0..300001]of longint;
	d:array[0..5,0..100001]of longint;
	l,r:longint;
	vis,Be:array[0..100001]of boolean;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure calc;
var
	i,j:longint;
	t:int64;
begin
	//for i:=1 to k-1 do write(a[i],'->');
	t:=0;
    for j:=1 to k-1 do t:=d[a[j],aim[a[j+1]]]+t;
    //writeln(a[k],' ',t);
	for i:=1 to n do
		if not be[i] then
			if t+d[a[1],i]+d[a[k],i]<ans then ans:=t+d[a[1],i]+d[a[k],i];
end;
procedure spfa(x:longint);
var
	i,j,k,b,ege:longint;
begin
	fillchar(d[x],sizeof(d[x]),$3f);d[x,aim[x]]:=0;
	l:=0;r:=1;q[r]:=aim[x];vis[aim[x]]:=true;
	repeat
		inc(l);if l>=300000 then l:=1;
		k:=q[l];vis[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				if d[x,k]+e[ege]<d[x,b] then
					begin
						d[x,b]:=d[x,k]+e[ege];
						if not vis[b] then
							begin
								inc(r);if r>=300000 then r:=1;
								vis[b]:=true;q[r]:=b;
                            end;
                    end;
				ege:=next[ege];
			end;
		until l=r;
end;
procedure dfs(x:longint);
var
	i:longint;
begin
	if x>=k+1 then exit;
	for i:=1 to k do
		if not v[i] then
			begin
				v[i]:=true;
				a[x]:=i;
				if x=k then calc;
				dfs(x+1);
				v[i]:=false;
            end;
end;
begin
	assign(input,'tour.in');reset(input);assign(output,'tour.out');rewrite(output);
	readln(n,m,k);ans:=maxlongint;
	for i:=1 to k do
		begin
			readln(aim[i]);
			Be[aim[i]]:=true;
		end;
	for i:=1 to m do
		begin
			readLn(x,y,z);
			add(x,y,z);add(y,x,z);
        end;
	for i:=1 to k do spfa(i);
{	for i:=1 to k do
		begin
			for j:=1 to n do
				write(' ',d[i,j]);
			writeln;
		end;}
	dfs(1);
	writeln(ans);
	close(output);
end.


