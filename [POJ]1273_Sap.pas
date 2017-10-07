var
	head,next,ed,e:array[0..400000]of longint;
	s,t,flow,tot,x,y,z,i,j,n,nn,m:longint;
	vh,v,h:array[0..2000]of longint;
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
	k,ege,b:longint;
	rest,minh:longint;
begin
	if m=t then exit(f);
	rest:=f;minh:=nn-1;
	ege:=head[m];
	while ege<>0 do
		begin
			b:=ed[ege];
			if (e[ege]>0)then
				begin
					if (h[b]+1=h[m]) then
						begin
							k:=sap(b,min(e[ege],rest));
							dec(e[ege],k);inc(e[ege xor 1],k);dec(rest,k);
							if h[s]>=nn then exit(f-rest);//f-rest:通过找增广路增加的流量；
						end;
					if h[b]<minh then minh:=h[b];
					if rest=0 then break;
				end;
			ege:=next[ege];
		end;
	if rest=f then//未找到增广路
		begin
			dec(vh[h[m]]);
			if vh[h[m]]=0 then h[s]:=nn;
			h[m]:=minh+1;
			inc(vh[h[m]]);
		end;
	exit(f-rest);
end;
begin
	while not eof do
		begin
			readln(n,m);tot:=1;flow:=0;
			fillchar(head,sizeof(head),0);fillchar(next,sizeof(next),0);
			s:=1;t:=m;nn:=n;//为增强通用性,nn:点的总数
			for i:=1 to n do
				begin
					readln(x,y,z);
					add(x,y,z);
				end;
			fillchar(h,sizeof(h),0);
			fillchar(vh,sizeof(vh),0);vh[0]:=n;
			while h[s]<nn do
				begin
					inc(flow,sap(s,1 shl 30));
				end;
			writeln(flow);
		end;
end.

