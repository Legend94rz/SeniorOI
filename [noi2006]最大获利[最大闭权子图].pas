const
	inf=1 shl 30;
var
	i,j,n,m,x,y,z:longint;
	s,t,nn:Longint;
	sum,tot,flow:longint;
	ed,e,next,head:array[0..4000001]of longint;
	h,vh:array[0..100001]of longint;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
procedure add(x,y,z:Longint);
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
function sap(m,f:longint):longint;
var
	k,b,ege,minh,rest:longint;
begin
	if m=t then exit(f);
	minh:=nn;rest:=f;
	ege:=head[m];
	while ege<>0 do
		begin
			b:=ed[ege];
			if e[ege]>0 then
			begin
				if h[b]+1=h[m] then
					begin
						k:=sap(b,min(rest,e[ege]));
						dec(e[ege],k);inc(e[ege xor 1],k);dec(rest,k);
						if h[s]>=nn then exit(f-rest);
					end;
				if rest=0 then break;
				if minh>h[b] then minh:=h[b];
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
begin
	assign(input,'profit.in');reset(input);assign(output,'profit.ans');rewrite(output);
	readln(n,m);tot:=1;s:=0;t:=n+m+1;nn:=t+1;
	for i:=1 to n do
		begin
			read(x);
			add(i,t,x);
		end;
	for i:=1 to m do
		begin
			readln(x,y,z);inc(sum,z);
			add(i+n,x,inf);
			add(i+n,y,inf);
			add(s,i+n,z);
		end;
	while h[s]<nn do inc(flow,sap(s,1 shl 30));
	writeln(sum-flow);close(output);
end.

