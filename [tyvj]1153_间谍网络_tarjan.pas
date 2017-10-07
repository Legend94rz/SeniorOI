var
	i,j,n,m,x,y:longint;
	low,rea,mny,lab,lmny:array[0..10001]of longint;
	head,ed,next,ss,ind:array[0..40001]of longint;
	v,st:array[0..100001]of longint;
	tot,top,time,no:longint;
	sum:int64;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
    exit(b);
end;
procedure add(x,y:longint);
begin
	inc(tot);
	ed[tot]:=y;ss[tot]:=x;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure dfs(x:Longint);
var
	k,b,ege:longint;
begin
	v[x]:=1;inc(time);rea[x]:=time;low[x]:=time;
	ege:=head[x];inc(top);st[top]:=x;
	while ege<>0 do begin
		b:=ed[ege];
		if v[b]=0 then dfs(b);
		if v[b]=1 then low[x]:=min(low[x],low[b]);
		ege:=next[ege];
	end;
	if rea[x]=low[x] then begin
		inc(no);
		while st[top+1]<>x do begin
			lab[st[top]]:=no;lmny[no]:=min(lmny[no],mny[st[top]]);
            v[st[top]]:=2;
			dec(top);
		end;
	end;
end;
begin
	readln(n);
	readln(m);fillchar(mny,sizeof(mny),$7f);fillchar(lmny,sizeof(lmny),$7f);
	for i:=1 to m do begin
		readln(x,y);
		mny[x]:=y;
	end;
	readln(m);
	for i:=1 to m do begin
		readln(x,y);add(x,y);
	end;
	for i:=1 to n do if v[i]<>2 then dfs(i);
	for i:=1 to m do begin
		//writeln('Now : ',i,' ',lab[ss[i]],'->',lab[ed[i]]);
		if lab[ss[i]]<>lab[ed[i]] then inc(ind[lab[ed[i]]]);
    end;
    //for i:=1 to n do writeln(i,' ',lab[i],' ',ind[lab[i]]);
    //for i:=1 to no do writeln('>>',lmny[i]);
	for i:=1 to no do
		if ind[i]=0 then begin
			inc(sum,lmny[i]);
			if sum>=$7f7f7f7f then begin
                writeln('NO');
				for j:=1 to n do
					if lab[j]=i then begin
						writeln(j);
						break;
					end;
				exit;
			end;
		end;
	writeln('YES');
	writeln(sum);
end.

