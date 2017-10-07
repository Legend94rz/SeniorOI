const
	inf=1 shl 30;
var
	i,j,n,m,s,t,nn,x,y,z:longint;
	next,ed,e,head:array[0..40001]of longint;
	tot,sum,flow:longint;
	h,vh:array[0..10001]of longint;
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
function min(a,b:longint):Longint;
begin
	if (a<b) then exit(a);
	exit(b);
end;
function sap(m,f:Longint):longint;
var
	k,b,ege,minh,rest:longint;
begin
	if (m=t) then exit(f);
	rest:=f;minh:=nn;
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
procedure print;
var
	k,b,ege,i:longint;
begin
	for i:=0 to t do
		begin
			write(i);
			ege:=head[i];
			while ege<>0 do
				begin
					if e[ege]=0 then begin ege:=next[ege];continue;end;
					write('->',ed[ege]);
					ege:=next[ege];
                end;
			writeln;
        end;
end;
begin
	assign(input,'shut.in');reset(input);assign(output,'shut.out');rewrite(output);
	readln(n,m);tot:=1;s:=0;t:=n+m+1;nn:=t+1;
	for i:=1 to n do
		begin
	   		read(x);inc(sum,x);
			add(s,i,x);
			while not eoln do
				begin
					read(y);
	            	add(i,y+n,inf);
				end;
        end;
	for i:=1 to m do
		begin
	        read(x);
			add(i+n,t,x);
		end;
	//print;
	while h[s]<nn do inc(flow,sap(s,1 shl 30));
	writeln(sum-flow);
	close(output);
end.

