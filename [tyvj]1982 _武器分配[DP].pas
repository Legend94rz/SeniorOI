type
	arr=array[0..201]of longint;
var
	i,j,n,la,lb,k,x,y:longint;
	a,b:arr;
	f:array[0..201,0..201,0..201]of longint;
	g:array[0..201,0..201]of longint;
procedure qsort(var a:arr;s,t:longint);
var
	i,j,k,u:longint;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1];
	repeat
		while a[j]>k do dec(j);
		while a[i]<k do inc(i);
		if i<=j then
			begin
				u:=a[i];a[i]:=a[j];a[j]:=u;
				inc(i);dec(j);
			end;
	until i>j ;
	if (s<j) then qsort(a,s,j);
	if (i<t) then qsort(a,i,t);
end;
function min(a,b,c:longint):longint;
begin
	min:=a;
	if min>b then min:=b;
	if min>c then min:=c;
end;
begin
//	assign(input,'dq.in');reset(input);assign(output,'dq.out');rewrite(output);
	readln(n,la,lb);
	for i:=1 to la do read(a[i]);
	for i:=1 to lb do read(b[i]);
	qsort(a,1,la);
	qsort(b,1,lb);
	fillchar(f,sizeof(f),$3f);f[0,0,0]:=0;
	for i:=1 to n do
		begin
			for j:=i to la do
				for k:=i to lb do
					begin
						{for x:=i-1 to j-1 do
							for y:=i-1 to k-1 do
								if f[i-1,x,y]+(a[j]-b[k])*(a[j]-b[k])<f[i,j,k] then
									f[i,j,k]:=f[i-1,x,y]+(a[j]-b[k])*(a[j]-b[k]);
						f[i,j,k]:=min(f[i,j,k],f[i,j-1,k],f[i,j,k-1]);}
						f[i,j,k]:=min(f[i,j,k],g[j-1,k-1]+(a[j]-b[k])*(a[j]-b[k]),$3f3f3f3f);
						f[i,j,k]:=min(f[i,j,k],f[i,j-1,k],f[i,j,k-1]);
					end;
			for j:=i to la do
				for k:=i to lb do
					begin
						g[j,k]:=f[i,j,k];
						if j>i then g[j,k]:=min(g[j-1,k],g[j,k],$3f3f3f3f);
						if k>i then g[j,k]:=min(g[j,k-1],g[j,k],$3f3f3f3f);
                    end;
        end;
	writeln(f[n,la,lb]);
	close(output);
end.

