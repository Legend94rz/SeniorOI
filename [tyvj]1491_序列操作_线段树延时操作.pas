type
	tree=record
		sum,yan:longint;
		end;
var
	ct,x,y,z,i,j,n,m:longint;
	f:array[0..4000001]of tree;
procedure gai(a,b,l,r,c,p:longint);
var
	k:longint;
begin
	if (a=l)and(b=r) then
		begin
			inc(f[p].yan,c);exit;
        end;
	if c<>0 then
		begin
			inc(f[p].sum,(r-l+1)*c);//这里是(r-l+1)*f[p].yan
			k:=(a+b)shr 1;
			if (r<=k) then begin gai(a,k,l,r,c,p shl 1);exit;end;
			if (l>k) then begin gai(k+1,b,l,r,c,p shl 1+1);exit;end;
			gai(a,k,l,k,c,p shl 1);
			gai(k+1,b,k+1,r,c,p shl 1+1);
        end;
end;
{
线段树的修改:
对某个区间进行修改时，分两种情况：
1、如果当前区间恰好为所要修改的区间时，则修改其 延时域，退出；
2、当前区间不是所要修改的区间时，对当前区间的 和 进行修改，并继续细分区间，修改。

查询：
分两步：
1、将当前区间的延时域下传（修改两个子节点的延时域，即子：=父+子），
  并且修改当前节点的和域（即：和：=和+增量*该区间内元素的个数），将延时域清零；
2、若当前区间恰好为查询区间，则返回该区间的和域；否则继续下分查找；
}
function ask(a,b,l,r,p:longint):longint;
var
	k:longint;
begin
	if f[p].yan<>0 then
		begin
			inc(f[p shl 1].yan  ,f[p].yan);
			inc(f[p shl 1+1].yan,f[p].yan);
			inc(f[p].sum,(b-a+1)*f[p].yan);//注意：这里是(b-a+1)*f[p].yan
			f[p].yan:=0;
        end;
	if (a=l)and(b=r) then exit(f[p].sum);
	k:=(a+b)shr 1;
    if (l>k) then exit(ask(k+1,b,l,r,p shl 1+1));
	if (r<=k) then exit(ask(a,k,l,r,p shl 1));
	exit(ask(a,k,l,k,p shl 1)+ask(k+1,b,k+1,r,p shl 1+1));
end;
procedure build(l,r,p:longint);
var
	k:longint;
begin
	if l>r then exit;
	if (l=r) then begin f[p].sum:=0;f[p].yan:=0;exit;end;
	k:=(l+r)shr 1;
	build(l,k,p shl 1);
	build(k+1,r,p shl 1+1);
	f[p].sum:=f[p shl 1+1].sum+f[p shl 1].sum;
end;
begin
	readln(n);
	build(1,n,1);
	readln(m);
	for i:=1 to m do
		begin
			read(ct);
			if ct=1 then
				begin
	            	readln(x,y);z:=1;
					gai(1,n,x,y,z,1);//这里提供一个接口z
				end
			else
				begin
					readln(x);
					writeln(ask(1,n,x,x,1)mod 2);
				end;
        end;
end.

