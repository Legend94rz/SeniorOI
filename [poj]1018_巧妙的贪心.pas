type
	arr=array[0..101,1..2]of longint;
var
	u,i,j,n,m,x,t,k,sum,cnt:longint;
	f:array[0..1,0..101]of arr;
	q:array[0..101]of longint;
	ans,ta:double;
procedure qsort(var a:arr;s,t:longint;x:longint);
var
	i,j,k:longint;
	u:array[1..2]of longint;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1,x];
	repeat
		while (a[j,x]>k)do dec(j);
		while (a[i,x]<k)do inc(i);
		if i<=j then
			begin
				u:=a[i];a[i]:=a[j];a[j]:=u;
				inc(i);dec(j);
            end;
	until i>j;
	if(s<j) then qsort(a,s,j,x);
	if(i<t) then qsort(a,i,t,x);
end;
begin
	read(t);
	for u:=1 to t do
		begin
			readln(n);
			for i:=1 to n do
				begin
					read(x);f[0,i,0,1]:=x;f[1,i,0,1]:=x;
					for j:=1 to x do read(f[0,i,j,1],f[0,i,j,2]);
                    f[1,i]:=f[0,i];
                end;
			for I:=1 to n do
				begin
                	qsort(f[0,i],1,f[0,i,0,1],1);//按照b排序
					qsort(f[1,i],1,f[1,i,0,1],2);
				end;
			{for k:=0 to 1 do
				for i:=1 to n do
                    begin
						for j:=1 to f[0,i,0,1] do
							write(f[k,i,j,1],' ',f[k,i,j,2],'/');
						writeln;
               	 	end;}
			ans:=0;
			for i:=1 to n do
				begin
                    fillDword(q,sizeof(q)shr 2,1);
					for j:=1 to f[0,i,0,1] do
						begin
							x:=f[0,i,j,1];sum:=0;cnt:=0;
							for k:=1 to n do
									begin
										while (f[1,k,q[k],1]<x)and(q[k]<=f[0,k,0,1]) do inc(q[k]);
										if q[k]<=f[0,k,0,1] then begin inc(cnt);inc(sum,f[1,k,q[k],2]);end;
									end;
							if (sum>0)and(cnt=n)then if x/sum>ans then ans:=x/sum;//注意此处sum>0!
                    	end;
				end;
			writeln(ans:0:3);
		end;
end.

