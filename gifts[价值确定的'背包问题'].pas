var
	i,j,n,m:longint;
	p,s,sum:array[0..100001]of int64;
	ans,k,vm:longint;
	t:int64;
procedure qsort(ss,tt:Longint);
var
	i,j:longint;
	k,u:int64;
begin
	i:=ss;j:=tt;k:=sum[(ss+tt)shr 1];
	repeat
		while (sum[j]>k) do dec(j);
		while (sum[i]<k) do inc(i);
		if i<=j then
			begin
				u:=s[i];s[i]:=s[j];s[j]:=u;
				u:=p[i];p[i]:=p[j];p[j]:=u;
				u:=sum[i];sum[i]:=sum[j];sum[j]:=u;
				inc(i);dec(J);
            end;
	until i>j;
	if (ss<j) then qsort(ss,j);
	if (i<tt) then qsort(i,tt);
end;
begin
	assign(input,'gifts.in');reset(input);assign(output,'gifts.out');rewrite(output);
	readln(n,m);
	for i:=1 to n do
		begin
			readln(s[i],p[i]);
			sum[i]:=s[i]+p[i];
		end;
	qsort(1,n);
	//for i:=1 to n do writeln(s[i],' ',p[i]);
	for I:=1 to n do
		begin
			t:=t+sum[i];
			if (s[i]>vm)and(t<=m) then vm:=s[i];
			if t>m then begin t:=t-sum[i];break;end;
		end;
	if (i=1)and (t=0) then begin t:=s[i] shr 1+p[i];k:=2;end else begin k:=i;dec(t,vm shr 1);end;
	while (t+sum[k]<=m)and(k<=n) do
		begin
			t:=t+sum[k];
			inc(k);
        end;
	if t<=m then writeln(k-1) else writeln(0);
	close(output);
end.

