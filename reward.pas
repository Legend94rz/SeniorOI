type
	arr=array[0..30005]of longint;
var
	i,j,x,y,max,k:longint;
	n,m:longint;
	b:array[0..10005,0..1500]of longint;
	w,v,ind:arr;
	q:arr;
	vis:array[0..10005]of boolean;
	l,r:longint;
	ans:int64;
function topsort:boolean;
var
	i,j,k:longint;
	h,t:longint;
	id:arr;
	u:arr;
begin
	id:=ind;u:=q;
	h:=0;t:=r;
	repeat
		inc(h);
		k:=u[h];
		for i:=1 to v[k] do
			begin
				dec(id[b[k,i]]);
				if id[b[k,i]]=0 then
					begin
						inc(t);
						u[t]:=b[k,i];
					end;
			end;
	until h>=t;
	if t<n then exit(false);
	exit(true);
end;
begin
	assign(input,'reward.in');reset(input);assign(outPUt,'reward.out');rewrite(output);
	readln(n,m);
	for i:=1 to m do
		begin
			readln(x,y);
			inc(v[y]);
			inc(ind[x]);
			b[y,v[y]]:=x;
		end;
	for i:=1 to n do
		if ind[i]=0 then
			begin
				inc(r);
				q[r]:=i;
			end;
	if not topsort then
		begin
			writeln('Poor Xed');
			close(output);
			halt;
		end;
	fillDword(w,sizeof(w)div 2,100);
	l:=0;
	vis[q[1]]:=true;
	repeat
		inc(l);
		k:=q[l];
		for i:=1 to v[k] do
			if w[b[k,i]]<=w[k] then
				begin
					w[b[k,i]]:=w[k]+1;
					if not vis[b[k,i]] then
						begin
							inc(r);
							q[r]:=b[k,i];
							vis[b[k,i]]:=true;
						end;
				end;
		vis[k]:=false;
	until l>=r;
	for i:=1 to n do
		inc(ans,w[i]);
	writeln(ans);
	close(input);close(output);
end.
