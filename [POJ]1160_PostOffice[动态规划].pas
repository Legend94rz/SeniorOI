var
	i,j,k,n,p,x:longint;
	f,c:array[-301..301,-301..301]of longint;//注意c的大小!
	loc:array[0..1000]of longint;
begin
	readln(n,p);
	for i:=1 to n do read(loc[i]);
	for i:=1 to n do
		for j:=i to n do
			begin
				x:=(i+j)shr 1;
				for k:=i to j do
					inc(c[i,j],abs(loc[k]-loc[x]));
				c[j,i]:=c[i,j];
            end;
	{for i:=1 to n do
		begin
		for j:=1 to n do
			write(c[i,j],' ');
		writeln;
		end;}
	for i:=1 to n do f[i,1]:=c[1,i];
	for i:=2 to p do
		for j:=i to n do
			begin
				x:=maxlongint;
				for k:=i-1 to j-1 do
					if x>f[k,i-1]+c[k+1,j] then
						x:=f[k,i-1]+c[k+1,j];
				f[j,i]:=x;
            end;
{
关于更新方法是以邮局p为阶段,而不是以村庄为阶段的说明:
应从动态方程上说起:
f[i,j]:=min(f[k,j-1]+c[k+1,i]);
表示前i个村庄分配j个邮局等于(前k个村庄分配j-1个邮局+从第k+1个村庄到第i个村庄修一个
邮局)的最小代价,其中k属于[j-1,i-1];
这就要求在更新时,前k个村庄分配j-1个邮局的结果都应该已经求出来了,
若以村庄为阶段,则不能满足此要求,所以必须以p为阶段,这样能保证在求第i个村庄时,前i-1个村庄的所有
情况都已经求得,可以直接利用.
}
	{for i:=1 to n do
		begin
        for j:=1 to n do
			if f[i,j]<$3f3f3f3f then
				write(f[i,j],' ')
			else
				write('F ');
		writeln;
		end;}
	writeln(f[n,p]);
end.

