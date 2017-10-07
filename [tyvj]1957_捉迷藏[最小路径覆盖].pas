var
	i,j,n,m,x,y,s,t:longint;
	ed,e,next,head:array[0..1000001]of longint;
	tot,flow,nn:longint;
	h,vh:array[0..10001]of longint;
function min(a,b:longinT):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
procedure add(x,y:longint);
begin
	inc(tot);
	e[tot]:=1;ed[tot]:=y;
	next[tot]:=head[x];
	head[x]:=tot;
	inc(tot);
	e[tot]:=0;ed[tot]:=x;
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
							dec(e[ege],k);dec(rest,k);inc(e[ege xor 1],k);
							if h[s]>=nn then exit(f-rest);
						end;
					if rest=0 then break;
					if h[b]<minh then minh:=h[b];
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
	readln(n,m);tot:=1;s:=0;t:=n*2+1;nn:=t+1;
	for i:=1 to m do
		begin
			readln(x,y);
			add(x,y+n);
		end;
	for i:=1 to n do add(s,i);
	for i:=n+1 to 2*n do add(i,t);
	while h[s]<nn do inc(flow,sap(s,1 shl 30));
	writeln(n-flow);
end.

