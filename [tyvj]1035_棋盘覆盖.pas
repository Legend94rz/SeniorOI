uses math;
var
	n,m,t,i,j,x,y:longint;
	vis:array[-101..10101]of boolean;
	match,ed,head,next:array[0..400001]of longint;
	tot,ans:longint;
	bol,f:array[-101..10101]of boolean;
procedure add(x,y:longint);
begin
	inc(tot);
	ed[tot]:=y;
	next[tot]:=head[x];
	head[x]:=tot;
end;
function dfs(x:longint):boolean;
var
	i,j:longint;
	ege,b,k:longint;
begin
	ege:=head[x];
	while ege<>0 do
		begin
			b:=ed[ege];
			if not vis[b] then
				begin
					vis[b]:=true;
					if (match[b]=0) or(dfs(match[b])) then
						begin
							match[b]:=x;
							exit(true);
                        end;
                end;
			ege:=next[ege];
		end;
	exit(false);
end;
begin
	//assign(input,'input.txt');reset(input);assign(output,'output.txt');rewrite(output);
	readln(n,m);fillchar(f,sizeof(f),false);
	for i:=1 to m do
		begin
			readln(x,y);
			f[(x-1)*n+y]:=true;
        end;
   for i:=1 to n do
		for j:=1 to n do
			if (i+j)mod 2=0 then
				bol[(i-1)*n+j]:=true;
    for i:=1 to n*n do
		if not f[i] then //if bol[i] then
		begin
			t:=i mod n;x:=i div n+1;if t=0 then begin dec(x);t:=n;end;
	        if (not f[i-1])and(t>1) then add(i,i-1);
			if (not f[i+1])and(t<n) then add(i,i+1);
			if (not f[i-n])and(x>1) then add(i,i-n);
			if (not f[i+n])and(x<n) then add(i,i+n);
		end;
	//writeln('tot=',tot);
	fillchar(match,sizeof(match),0);
	for i:=1 to n*n do
		begin
			if (not f[i])and(bol[i]) then
				begin
					fillchar(vis,sizeof(vis),0);
					if dfs(i) then inc(ans);
				end;
		end;
	writeln(ans);
	close(output);
end.

