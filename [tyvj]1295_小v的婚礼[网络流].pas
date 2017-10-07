const
	inf=$3f3f3f3f;
var
	ed,e,head,next:array[0..1000001]of longint;
	tot:longint;
	u,i,j,k,l,n,m,p,d,person,count,nn:longint;
	s,t,flow:longint;
	ch:char;
	re,cc:array[0..101,0..101]of longint;
	pe:array[0..101,0..101]of boolean;
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
function min(a,b:longint):longint;
begin
	if(a<b) then exit(a);
	exit(b);
end;
function sap(m,f:longint):longint;
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
	k,b,ege:longint;
begin
	for i:=0 to t do
		begin
			write(i);
			ege:=head[i];
			while ege<>0 do
				begin
					if e[ege]<=0 then begin ege:=next[ege];continue;end;
					write('->',ed[ege]);
					ege:=next[ege];
                end;
			writeln;
        end;
end;

begin
	//assign(output,'test.txt');rewrite(output);
	readln(p);
	for u:=1 to p do
		begin
			fillchar(head,sizeof(head),0);tot:=1;s:=0;
			readln(n,d);
			for i:=1 to n do
				begin
					j:=0;
					while not eoln do
						begin
							inc(j);
							read(ch);
							re[i,j]:=ord(ch)-48;
                 	  	end;
					readln;
				end;
			for i:=1 to n do
				begin
					j:=0;
					while not eoln do
						begin
							inc(j);
							read(ch);
							pe[i,j]:=ch='P';
						end;
					readln;
                end;m:=j;
			for i:=1 to n do
				for j:=1 to m do
					if (re[i,j]>0)or(pe[i,j]) then
						begin
							inc(count);
							cc[i,j]:=count;
						end;
            nn:=count*2+2;t:=nn-1;
//_-------------------Debug
		{	for i:=1 to n do
				begin
                	for J:=1 to m do
						write(cc[i,j],' ');
					writeln;
				end;}
//---------------------------------

			for i:=1 to n do
				for j:=1 to m do
					begin
						if (re[i,j]>0)and((i<=d)or(j<=d)or(n-i+1<=d)or(m-j+1<=d)) then
							add(cc[i,j]+count,t,inf);
						if (pe[i,j]) then add(s,cc[i,j],1);
						if re[i,j]>0 then add(cc[i,j],cc[i,j]+count,re[i,j]);
						for k:=1 to n do
							for l:=1 to m do
								if (abs(i-k)+abs(j-l)<=d)and(abs(i-k)+abs(j-l)>0)and(cc[k,l]>0)and(cc[i,j]>0) then
									add(cc[i,j]+count,cc[k,l],inf);
						//这里判断(i,j)与(k,l)不是同一点要(abs(i-k)+abs(j-l)>0)，不能(k<>i)or(j<>l),
						//原因未知。。

					end;

           	//print;//debug

			fillchar(vh,sizeof(vh),0);fillchar(h,sizeof(h),0);flow:=0;
			while h[s]<nn do inc(flow,sap(s,1 shl 30));
			writeln(flow);
        end;
	//close(output);
end.

