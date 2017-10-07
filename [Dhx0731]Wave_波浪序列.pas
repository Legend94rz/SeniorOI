type
	buf=array[0..2001]of longint;
var
	i,j,n,m,Low,High,Ans:longint;
	Down,Up:array[0..2001]of buf;
	f,g,a:array[0..2001]of longint;
procedure Buffer(x:longint;Var Ans:Buf);
var
	i:longint;
	l,r,mid,len:longint;
	Temp:array[0..2001]of longint;
begin
	len:=0;fillchar(Ans,sizeof(Ans),0);
	fillchar(Temp,sizeof(Temp),$80);
	for i:=x to n do
		begin
			l:=0;r:=len;
			repeat
				mid:=(l+r) shr 1;
				if Temp[mid]<a[i] then
					L:=mid+1
				else
					r:=mid-1;
			until l>r;
			Temp[l]:=a[i];
			if l>len then len:=l;
			Ans[i]:=l;
			if l<Low then ans[i]:=-$3f3f3f3f;
			if l>High then ans[i]:=High;
        end;
end;
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
begin
	assign(input,'wave.in');reset(input);assign(output,'wave.out');rewrite(output);
	readln(n);
	readln(Low,High);
	for I:=1 to n do read(a[i]);
	for i:=1 to n do
		begin
			Buffer(i,up[i]);//由i开始，长度在[Low,High]的最长上升子序列的长度
			A[I]:=-a[i];//方便以后利用Buffer子过程
		end;
//	for i:=1 to n do write(up[1,i],',');writeln;
	for i:=1 to n do
		Buffer(i,down[i]);
	for i:=1 to n do
		begin
			for j:=1 to i-1 do
				begin
					if max(g[j]+up[j,i]-1,up[j,i])>f[i] then f[i]:=max(g[j]+up[j,i]-1,up[j,i]);
					if max(f[j]+down[j,i]-1,down[j,i])>g[i] then g[i]:=max(f[j]+down[j,i]-1,down[j,i]);
				end;
			if f[i]>ans then ans:=f[i];
			if g[i]>ans then ans:=g[i];
		end;
	writeln(ans);
	close(output);
end.


