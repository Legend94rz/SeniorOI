type
	tree=record
		sum,yan:int64;
		end;
var
	i,n,m:longint;
	x:char;
	y,z,c:longint;
	ans:int64;
	f:array[0..7800001]of tree;
	a:array[0..2000001]of integer;
procedure build(l,r,p:longint);
var
	k:longint;
begin
	if (l>r) then exit;
	if (l=r) then begin f[p].sum:=a[l];f[p].yan:=0;exit;end;
	k:=(l+r)shr 1;
	build(l,k,p shl 1);
	build(k+1,r,p shl 1+1);
	f[p].sum:=f[p shl 1].sum+f[p shl 1+1].sum;
end;
procedure ask(a,b,l,r,p:longint);
var
	k:longint;
begin
	if f[p].yan<>0 then
		begin
			inc(f[p shl 1].yan  ,f[p].yan);
			inc(f[p shl 1+1].yan,f[p].yan);
			inc(f[p].sum,(b-a+1)*f[p].yan);//这里要注意是(b-1+1)而不是(r-l+1)，因为
										   //(a,b)里每一个数都有延时，改的区间是(a,b)
			f[p].yan:=0;
        end;
	if (a=l)and(b=r) then begin inc(ans,f[p].sum);exit;end;
	k:=(a+b)shr 1;
	if (l>k) then
        ask(k+1,b,l,r,p shl 1+1)
    else
		if (r<=k) then
			ask(a,k,l,r,p shl 1)
		else
			begin
				ask(a,k,l,k,p shl 1);ask(k+1,b,k+1,r,p shl 1+1);
            end;
end;
procedure gai(a,b,l,r:longint;c:int64;p:longint);
var
	k:longint;
begin
	if (a=l)and(b=r) then
		begin
			inc(f[p].yan,c);exit;
        end;
	if c<>0 then
		begin
			inc(f[p].sum,(r-l+1)*c);
            k:=(a+b)shr 1;
			if (r<=k) then
                gai(a,k,l,r,c,p shl 1)
			else
				if (l>k) then
                    gai(k+1,b,l,r,c,p shl 1+1)
				else
					begin
						gai(a,k,l,k,c,p shl 1);
						gai(k+1,b,k+1,r,c,p shl 1+1);
					end;
        end;
end;
begin
	//assign(output,'out.txt');rewrite(output);
    readln(n,m);
	for i:=1 to n do read(a[i]);
	readln;
	build(1,n,1);
	for i:=1 to m do
		begin
			read(x);
			if x='Q' then
				begin
		            readln(y,z);
					ans:=0;
					ask(1,n,y+1,z+1,1);//此题下标从0开始，-_-|||被坑了n久。。T_T!。。
					writeln(ans);
				end
			else
				begin
					readln(y,z,c);
					gai(1,n,y+1,z+1,c,1);
				end;
	    end;
	//close(output);
end.

