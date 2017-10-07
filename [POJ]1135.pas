var
	a,b:array[0..10000]of longint;
	e:array[0..10000]of double;
	F:ArrAY[0..100000]of longint;
	i,j,n,m,count,p,px,py:longint;
	d:array[0..2005]of double;
	flag:boolean;
	last,max:double;
procedure qsort(s,t:longint);
var
	i,j,k,y:longint;
	te:double;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1];
	repeat
		while a[j]>k do dec(j);
		while a[i]<k do inc(i);
		if i<=j then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				y:=b[i];b[i]:=b[j];b[j]:=y;
				te:=e[i];e[i]:=e[j];e[j]:=te;
				inc(i);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
function min(a,b:longint):Longint;
begin
	if a<b then exit(a);
	exit(b);
end;
function maxx(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
procedure spfa;
var
	vis:array[0..2005]of boolean;
	l,r:longint;
	q:array[0..100000]of longint;
	i,k:longint;
begin
	fillchar(vis,sizeof(vis),0);vis[1]:=true;
	d[1]:=0;
	l:=0;r:=1;q[1]:=1;
	repeat
		inc(l);
		k:=q[l];
		for i:=f[k] to f[k+1]-1 do
			if d[k]+e[i]<d[b[i]] then
				begin
					d[b[i]]:=d[k]+e[i];
					if not vis[b[i]] then
						begin
							inc(r);
							q[r]:=b[i];
							vis[b[i]]:=true;
						end;
				end;
		vis[k]:=false;
	until l>=r;
end;
Begin
	//assign(output,'test.txt');rewrite(output);
	while true do
		begin
			readln(n,m);inc(count);
			if (n=m) and(n=0) then break;
			fillchar(a,sizeof(a),0);fillchar(e,sizeof(e),0);
			fillchar(b,sizeof(b),0);fillchar(f,sizeof(f),0);
			//fillchar(d,sizeof(d),$3f);writeln('test::',d[1]:0:3,' ',d[10]:0:3);
			for i:=1 to 2*n do d[i]:=9999999999;
			max:=0;p:=0;px:=0;py:=0;
			for i:=1 to m do
				begin
					readln(a[i],b[i],e[i]);
					a[i+m]:=b[i];b[i+m]:=a[i];e[i+m]:=e[i];
				end;
			m:=m*2;
			qsort(1,m);
			for i:=1 to m do
				if f[a[i]]=0 then f[a[i]]:=i;
			f[n+1]:=m+1;
			for i:=n downto 0 do
				if f[i]=0 then f[i]:=f[i+1];
			spfa;last:=0;flag:=false;
			{for i:=1 to n do
				writeln('di=',i,' ',d[i]:0:3,' ',f[i]);
			for i:=1 to m do
				writeln(a[i],' ',b[i],' ',e[i]:0:3);}
			for i:=1 to m do
				begin
				if abs(d[b[i]]-d[a[i]])<>e[i] then
					if (d[b[i]]-d[a[i]]+e[i])/2+d[a[i]]>last then
						begin
							last:=(d[b[i]]-d[a[i]]+e[i])/2+d[a[i]];
							px:=a[i];py:=b[i];
							flag:=true;
						end;
				if d[a[i]]>max then begin max:=d[a[i]];p:=a[i];end;
				if d[b[i]]>max then begin max:=d[b[i]];p:=b[i];end;
				end;
		writeln('System #',count);
		if m=0 then p:=1;
		if flag then
			writeln('The last domino falls after ',last:0:1,' seconds, between key dominoes ',min(px,py),' and ',maxx(px,py),'.')
		else
			writeln('The last domino falls after ',max:0:1,' seconds, at key domino ',p,'.');
		writeln;
	end;
	//close(output);
End.


