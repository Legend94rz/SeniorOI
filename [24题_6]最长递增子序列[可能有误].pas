const
	inf=1 shl 30;
var
	i,j,n,m,tl,s,t,nn,z:longint;
	tot:longint;
	flow:int64;
	f,a,vh,h:array[0..3001]of longint;
	next,ed,e,head:array[0..100001]of longint;
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
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
function sap(m,f:longint):int64;
var
	minh,rest,k,b,ege:longint;
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
	//assign(input,'alis.in');reset(input);assign(output,'alis.out');rewrite(output);
	readln(n);tot:=1;
	for i:=1 to n do
		begin
	        read(a[i]);
			f[i]:=1;
		end;
	for i:=n downto 1 do
		begin
			tl:=0;
			for j:=i+1 to n do
				if (a[j]>a[i])and(f[j]>tl) then
					tl:=f[j];
			f[i]:=tl+1;
		end;
	tl:=0;for i:=1 to n do if f[i]>tl then tl:=f[i];writeln(tl);
//-----------------------------------------
	s:=0;t:=2*n+1;nn:=t+1;
	for i:=1 to n do
		begin
			add(i,i+n,1);
			if f[i]=tl then add(s,i,1);
			if f[i]=1 then add(i+n,t,1);
			for j:=1 to i-1 do
				if (a[j]<a[i])and(f[i]+1=f[j]) then
					add(j+n,i,1);
        end;//print;
	while h[s]<nn do inc(flow,sap(s,1 shl 30));
	writeln(flow);
//-----------------------------------------
	fillchar(h,sizeof(h),0);fillchar(vh,sizeof(vh),0);vh[0]:=t+1;fillchar(head,sizeof(head),0);
	tot:=1;flow:=0;
	for i:=1 to n do
		begin
			if (i=1)or(i=n) then z:=inf else z:=1;
			add(i,i+n,z);
			if (f[i]=tl) then add(s,i,z);
			if (f[i]=1) then add(i+n,t,z);
			for j:=1 to i-1 do
				if (a[j]<a[i])and(f[i]+1=f[j]) then
					add(j+n,i,1);
        end;
	while h[s]<nn do inc(flow,sap(s,1 shl 30));
	if flow>=(1 shl 30)*2 then flow:=n;
	writeln(flow);//close(output);
end.

