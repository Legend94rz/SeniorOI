var
	i,j,n,m,s,t,nn,x,y:longint;
	ed,e,next,head:array[0..4000001]of longint;
	tot,flow:longint;
	h,vh:array[0..2001]of longint;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
procedure add(x,y,z:longint);
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
	minh,k,b,ege,rest:longint;
begin
	if(m=t) then exit(f);
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
							dec(rest,k);dec(e[ege],k);inc(e[ege xor 1],k);
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
	assign(input,'path.in');reset(input);assign(output,'path.out');rewrite(output);
	readln(n,m);tot:=1;s:=0;t:=2*n+1;nn:=t+1;
	for i:=1 to m do
		begin
    		readln(x,y);
			add(x,y+n,1);
        end;
	for i:=1 to n do
		begin
        	add(s,i,1);
			add(i+n,t,1);
		end;
	while h[s]<nn do inc(flow,sap(s,1 shl 30));
	writeln(n-flow);
	close(output);
end.

