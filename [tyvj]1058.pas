var
	i,j,k,n,m,p,l:longint;
	order,a,which:array[0..30,0..30]of longint;
	t,last,r:array[0..500]of longint;
	b:array[0..40,0..100000]of boolean;
	now,la,gj,gx,jq:longint;
function check(u,s,l:longint):boolean;
var
	i:longint;
begin
	for i:=s to s+l-1 do
		if b[u,i] then
			exit(false);
	exit(true);
end;
begin
	readln(m,n);
	for i:=1 to n do
		for j:=1 to m do
			read(order[i,j]);
	for i:=1 to n do
		for j:=1 to m do
			read(which[i,j]);
	for i:=1 to n do
		for j:=1 to m do
			read(a[i,j]);
	for i:=1 to n do
		for j:=1 to m do
			begin
				inc(t[order[i,j]]);
				gj:=order[i,j];gx:=t[order[i,j]];jq:=which[order[i,j],t[order[i,j]]];LA:=A[order[i,j],t[order[i,j]]];
				//writeln('will for ',gj,'-',gx,' find a position,it will be set on ',jq,' last ',la);
				if last[gj]=0 then
					begin
						for k:=1 to r[jq]+1 do
							if check(jq,k,la) then
								begin
									p:=k;
									break;
								end;
					end
				else
					begin
						p:=last[gj]+1;
						while not check(jq,p,la) do
							inc(p);
					end;
				for k:=p to p+la-1 			do b[jq,k]:=true;
				if p+la-1>r[jq] 	then r[jq]:=p+la-1;
				last[gj]:=p+la-1;
			end;
	for i:=2 to m do
		if r[i]>r[1] then
			r[1]:=r[i];
	writeln(r[1]);
end.

