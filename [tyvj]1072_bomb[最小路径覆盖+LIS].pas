var
	i,j,n,m:longint;
	x,y,z,f:array[0..1010]of longint;
	s,t,nn,tot,flow:longint;
	ed,e,head,next:array[0..2000010]of longint;
	h,vh:array[0..10010]of longint;
function min(a,b:Longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
function sap(m,f:longint):longint;
var
	rest,minh,k,b,ege:longint;
begin
	if m=t then exit(f);
	minh:=nn;rest:=f;
	ege:=head[m];
	while ege<>0 do
		begin
			b:=ed[ege];
            if e[ege]>0 then
                begin
					if h[m]=h[b]+1 then
						begin
							k:=sap(b,min(e[ege],rest));
                            dec(rest,k);inc(e[ege xor 1],k);dec(e[ege],k);
							if h[s]>=nn then exit(f-rest);
						end;
					if h[b]<minh then minh:=h[b];
                    if rest=0 then break;
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
procedure qsort(s,t:Longint);
var
	i,j,u:longint;
	k1,k2,k3:longint;
begin
	i:=s;j:=t;k1:=x[(s+t)shr 1];k2:=y[(s+t)shr 1];k3:=z[(s+t)shr 1];
	repeat
		while (x[j]>k1)or(x[j]=k1)and(y[j]>k2)or(x[j]=k1)and(y[j]=k2)and(z[j]>k3) do dec(j);
		while (x[i]<k1)or(x[i]=k1)and(y[i]<k2)or(x[i]=k1)and(y[i]=k2)and(z[i]<k3) do inc(i);
		if i<=j then
			begin
				u:=x[i];x[i]:=x[j];x[j]:=u;
				u:=y[i];y[i]:=y[j];y[j]:=u;
				u:=z[i];z[i]:=z[j];z[j]:=u;
				inc(i);dec(j);
            end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<T) then qsort(i,t);
end;
procedure add(x,y:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=1;
	next[tot]:=head[x];
	head[x]:=tot;

	inc(tot);
	ed[tot]:=x;e[tot]:=0;
	next[tot]:=head[y];
	head[y]:=tot;
end;
begin
//	assign(input,'1.in');reset(input);assign(output,'1.out');rewrite(output);
	readln(n);
	for i:=1 to n do readln(x[i],y[i],z[i]);
	qsort(1,n);
	for i:=1 to n do
		begin
			t:=0;
			for j:=i-1 downto 1 do
				if (x[j]<x[i])and(y[j]<y[i])and(z[j]<z[i])and(t<f[j]) then t:=f[j];
            f[i]:=t+1;
		end;
	for i:=1 to n do if f[i]>f[0] then f[0]:=f[i];
	writeln(f[0]);
//-----------------------------------
	tot:=1;s:=0;t:=2*n+1;nn:=t+1;
	for i:=1 to n-1 do
		for j:=i+1 to n do
			if (x[j]>x[i])and(y[j]>y[i])and(z[j]>z[i]) then
				add(i,j+n);
	for i:=1 to n do begin add(s,i);add(i+n,t);end;
	while h[s]<nn do inc(flow,sap(s,1 shl 30));
	writeln(n-flow);
//	close(output);
end.

