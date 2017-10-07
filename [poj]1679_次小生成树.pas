var
	tot,i,j,n,m,t,u,x,y,z,ans,mst:longint;
	a,b,e:array[0..10001]of longint;
	flag:array[0..10001]of boolean;
	f,next,ed,head,c:array[0..2001]of longint;
	maxw:array[0..101,0..101]of longint;
    vis:array[0..101]of boolean;
	no:boolean;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;c[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
function getf(x:longint):longint;
var
	c,t:longint;
begin
	c:=x;
	while f[x]<>x do x:=f[x];
	while c<>x do
		begin
			t:=f[c];
			f[c]:=x;
			c:=t;
		end;
	exit(x);
end;
procedure qsort(s,t:longint);
var
	i,j,k,u:longint;
begin
	i:=s;j:=t;k:=e[(s+t)shr 1];
	repeat
		while e[j]>k do dec(j);
		while e[i]<k do inc(i);
		if i<=j then
			begin
				u:=a[i];a[i]:=a[j];a[j]:=u;
				u:=b[i];b[i]:=b[j];b[j]:=u;
				u:=e[i];e[i]:=e[j];e[j]:=u;
				inc(i);dec(j);
            end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
procedure dfs(x,m:longint);
var
	b,ege:longint;
begin
	ege:=head[x];
	//if (i=3) then writeln(x,' ',m);
	while ege<>0 do
		begin
			b:=ed[ege];
			if not vis[b] then
				begin
					vis[b]:=true;
					if c[ege]>m then m:=c[ege];
					maxw[i,b]:=m;//if (i=2)and(b=1) then writeln('Warning: ',ege,' ',c[ege],' ',maxw[i,b],' ',m);
					dfs(b,m);m:=0;
				end;
			ege:=next[ege];
        end;
end;
begin
	readln(t);
	for u:=1 to t do
		begin
			readln(n,m);
			for i:=1 to n do f[i]:=i;
			fillchar(head,sizeof(head),0);fillchar(flag,sizeof(flag),0);tot:=0;
			fillchar(maxw,sizeof(maxw),0);mst:=0;
			for i:=1 to m do
				begin
					readln(x,y,z);
					a[i]:=x;b[i]:=y;e[i]:=z;
                end;
			qsort(1,m);
			for i:=1 to m do
				begin
					x:=getf(a[i]);y:=getf(b[i]);
					if x<>y then
						begin
							f[x]:=y;flag[i]:=true;inc(mst,e[i]);
                            add(a[i],b[i],e[i]);add(b[i],a[i],e[i]);
                        end;
                end;
			for i:=1 to n do
				begin
					fillchar(vis,sizeof(vis),0);vis[i]:=true;
					dfs(i,0);no:=false;
					for j:=1 to n do if not vis[j] then begin writeln(0);no:=true;break;end;
					if no then break;
				end;
			if no then continue;
			{for i:=1 to n do
				begin
				for j:=1 to n do
					write(maxw[i,j],' ');
				writeln;
				end;}
			ans:=maxlongint;
			for i:=1 to m do
				if not flag[i] then
					if mst-e[i]+maxw[a[i],b[i]]<ans then ans:=mst-e[i]+maxw[a[i],b[i]];
			if ans=mst then
				writeln('Not Unique!')
			else
				writeln(mst);
		end;

end.

