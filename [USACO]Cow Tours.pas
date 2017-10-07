{
ID:rz109291
PROG:cowtour
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: cowtour
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 2404 KB]
   Test 2: TEST OK [0.000 secs, 2404 KB]
   Test 3: TEST OK [0.000 secs, 2404 KB]
   Test 4: TEST OK [0.000 secs, 2404 KB]
   Test 5: TEST OK [0.027 secs, 2404 KB]
   Test 6: TEST OK [0.054 secs, 2404 KB]
   Test 7: TEST OK [0.054 secs, 2404 KB]
   Test 8: TEST OK [0.054 secs, 2404 KB]
   Test 9: TEST OK [0.027 secs, 2404 KB]

All tests OK.
Your program ('cowtour') produced all correct answers!  This is your
submission #3 for this problem.  Congratulations!
}
var
	i,j,n:longint;
	x,y,v,l:array[0..300]of longint;
	a,b:array[0..300,0..300]of longint;
	e,dist:array[0..300,0..300]of real;
	maxp:array[0..300]of real;
	s:string;
	min,t,m:real;
procedure floyd;
var
	i,j,k:longint;
begin
	for k:=1 to n do
		for i:=1 to n do
			if k<>i then//这句判断不要忘
				for j:=1 to n do
					if (k<>j)and(i<>j) then//这句判断不要忘
						if (e[i,j]>e[i,k]+e[k,j])and(e[i,k]<>$3f3f3f3f)and(e[k,j]<>$3f3f3f3f) then begin
							e[i,j]:=e[i,k]+e[k,j];
							e[j,i]:=e[i,j];//最好加上(无向图)
						end;
end;
begin
	assign(input,'cowtour.in');reset(input);assign(output,'cowtour.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		readln(x[i],y[i]);
	for i:=1 to n do
		begin
			readlN(s);
			for j:=1 to length(s) do
				if s[j]='1' then
					e[i,j]:=sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j]))
				else
					e[i,j]:=$3f3f3f3f;
		end;
	{for i:=1 to n do
		for j:=1 to n do
			begin
				dist[i,j]:=e[i,j];
				if i=j then dist[i,j]:=0;
				//if dist[i,j]=$3f3f3f3f then continue;
			        //writeln('dist[',i,',',j,']=',dist[i,j]:0:6);
			end;}
	floyd;
	{writeln('---------------') ;
	for i:=1 to n do
		for j:=1 to n do
			begin
				if dist[i,j]=$3f3f3f3f then continue;
				writeln('dist[',i,',',j,']=',dist[i,j]:0:6);
			end; }
	for I:=1 to n do
		begin
			maxp[i]:=0;
			for j:=1 to n do
				if (e[i,j]<>$3f3f3f3f)and(e[i,j]>maxp[i]) then
					maxp[i]:=e[i,j];
		end;
	min:=$3f3f3f3f;m:=0;
	for I:=1 to n do
		for j:=1 to n do
			if (e[i,j]<>$3f3f3f3f)and(maxp[j]>m) then
				m:=maxp[j];
	{for i:=1 to n do
		begin
		writeln('maxp[',i,']=',maxp[i]:0:6);
		writeln('d[',i,']=',d[i]:0:6);
		end;}
	for i:=1 to n-1 do
		for j:=i+1 to n do
			if e[i,j]=$3f3f3f3f then
				begin
					t:=sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j]))+maxp[i]+maxp[j];//不在一个连通块里的两个点之间的距离
					if t<m then t:=m;//m:两点间最长的距离
					if t<min then
						begin
							min:=t;
							//writeln(min:0:6,' ',i,' ',j);
						end;
				end;
	writeln(min:0:6);
	close(input);close(output);
end.
