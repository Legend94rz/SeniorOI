var
	n,m,i,j,k,c:longint;
	e,ed,next,head:array[0..80001]of longint;
	tot,flow,sm:longint;
	s,t,x,y,z,ans,nn,max:longint;
	a:array[0..401,0..401]of longint;
	h,vh:array[0..300]of longint;
	//f:array[0..401,0..401]of boolean;
	l,r,mid:longint;
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
function sap(m,f:longint):longint;
var
	minh,rest,ege,b,k:longint;//这里的变量一定要看好...别多也别少...
begin
	if m=t then exit(f);
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
					if minh>h[b] then minh:=h[b];
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
	for i:=0 to n do
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
procedure floyd;
var
	i,j,k:longint;
begin
	for k:=1 to n do
		for i:=1 to n do
			for j:=1 to n do
				if a[i,k]+a[k,j]<a[i,j] then
					a[i,j]:=a[i,k]+a[k,j];
end;
begin
	//assign(input,'test.in');reset(input);
	readln(k,c,m);ans:=1 shl 30;n:=k+c;
	for i:=1 to k+c do
		for j:=1 to k+c do
			begin
	            read(a[i,j]);
				if a[i,j]<ans then ans:=a[i,j];
				if (i<>j)and(a[i,j]=0) then a[i,j]:=$3f3f3f3f;
			end;
	s:=0;t:=k+c+1;nn:=t+1;tot:=1;dec(ans);
	{for i:=1 to k do add(i,t,m);
	for i:=k+1 to k+c do add(s,i,1);}
	floyd;
	{for i:=1 to n do
		begin
        for j:=1 to n do
			write(a[i,j],' ');
		writeln;
		end;}
	{while flow<c do
		begin
			inc(ans);
			for i:=1 to k+c do
				for j:=1 to i do
					if (a[i,j]>0)and(a[i,j]<=ans)then
						add(i,j,1 shl 30);
			//print;
			fillchar(h,sizeof(h),0);fillchar(vh,sizeof(vh),0);
			while h[s]<nn do inc(flow,sap(s,1 shl 30));
			//writeln(ans,' ',flow);readln;
        end;}
	l:=0;r:=80001;
	repeat
		mid:=(l+r) shr 1;
		flow:=0;
		fillchar(h,sizeof(h),0);fillchar(vh,sizeof(vh),0);fillchar(head,sizeof(head),0);
		tot:=1;for i:=1 to k do add(i,t,m);for i:=k+1 to k+c do add(s,i,1);flow:=0;
		for i:=k+1 to k+c do
			for j:=1 to k do
				if (a[i,j]>0)and(a[i,j]<=mid) then
					add(i,j,1 shl 30);
		while h[s]<nn do inc(flow,sap(s,1 shl 30));
        //writeln(mid,' ',flow);print;readln;
		if flow<c then
			l:=mid+1
		else
			r:=mid-1;

	until l>r;
	writeln(l);
end.

