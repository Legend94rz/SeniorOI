var
	i,j,n,m,e:Longint;
	op,rop:array[0..101,0..101]of byte;
	c,tc:char;
	a,ra,ans,eans:array[0..101]of longint;
	fm,fn:array[0..101,0..101]of longint;
	la,ls:longint;
procedure dp;
var
	i,j,k,l:longint;
	tm,tn:longint;
begin
	for i:=1 to n do begin fm[i,i]:=ra[i];fn[i,i]:=ra[i];end;
	for l:=2 to n do
		for i:=1 to n-l+1 do
	        begin
				j:=i+l-1;tm:=-maxlongint;tn:=maxlongint;
				for k:=i to j-1 do
					if rop[k,k+1]=1 then
						begin
							if fm[i,k]+fm[k+1,j]>tm then tm:=fm[i,k]+fm[k+1,j];
							if fn[i,k]+fn[k+1,j]>tm then tm:=fn[i,k]+fn[k+1,j];
							if fn[i,k]+fn[k+1,j]<tn then tn:=fn[i,k]+fn[k+1,j];
                            if fm[i,k]+fm[k+1,j]<tn then tn:=fm[i,k]+fm[k+1,j];
						end
					else
						begin
                            if fn[i,k]*fn[k+1,j]>tm then tm:=fn[i,k]*fn[k+1,j];
							if fm[i,k]*fm[k+1,j]>tm then tm:=fm[i,k]*fm[k+1,j];
							if fn[i,k]*fn[k+1,j]<tn then tn:=fn[i,k]*fn[k+1,j];
                            if fm[i,k]*fm[k+1,j]<tn then tn:=fm[i,k]*fm[k+1,j];
						end;
				fn[i,j]:=tn;fm[i,j]:=tm;
			end;
	//writeln(fm[1,2],' ',fm[2,3],' ',fm[3,4]);
	//writeln({e,' ',}fm[1,n]);
	ans[e]:=fm[1,n];
end;
begin
	readln(n);
	read(c);read(tc);read(a[1]);
	if c='t' then
		op[n,1]:=1
	else
		op[n,1]:=2;
	op[1,n]:=op[n,1];
	for i:=2 to n do
		begin
			read(tc);read(c);read(a[i]);
			if c='t' then
				op[i-1,i]:=1
			else
				op[i-1,i]:=2;
			op[i,i-1]:=op[i-1,i];
        end;readln;
	for e:=1 to n do
		begin
			la:=0;fillchar(rop,sizeof(rop),0);
            inc(la);ra[la]:=a[e];
			for i:=e+1 to n do
				begin
					inc(la);
					ra[la]:=a[i];
					rop[la-1,la]:=op[i-1,i];
				end;
			for i:=1 to e-1 do
				begin
					inc(la);
					ra[la]:=a[i];
					if i>1 then
						rop[la-1,la]:=op[i-1,i]
					else
						rop[la-1,la]:=op[n,1];
				end;
			{writeln('-------------');
			writeln('cur e=',e,' ');
			for i:=1 to n-1 do write(ra[i],' ');writeln(ra[n]);
			for i:=2 to n do write(rop[i-1,i],' ');writeln;}
			dp;
        end;
	//writeln('============');
	ans[0]:=-maxlongint;
	for i:=1 to n do
		begin
			if ans[i]>ans[0] then
				begin
					ans[0]:=ans[i];
					ls:=1;eans[ls]:=i;
				end
			else
				if ans[i]=ans[0] then begin inc(ls);eans[ls]:=i;end;
        end;
	writeln(ans[0]);
	for i:=1 to ls-1 do write(eans[i],' ');
	writeln(eans[ls]);
end.

