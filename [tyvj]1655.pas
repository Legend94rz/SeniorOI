var
	a:array[0..1001]of longint;
	ans:longint;
	sum:int64;
	n,m,i,l,r:longint;
	t,j:int64;
	mid,min,max:int64;
begin
	readln(n,m);
	for I:=1 to m do
		read(a[i]);
        min:=1;max:=9999999999999;
	repeat
		mid:=(min+max)shr 1;
		//writeln(mid);
		sum:=0;
		for i:=1 to m do
			inc(sum,mid div a[i]+1);
		if sum>=n then
			max:=mid -1
		else
			min:=mid+1;
	until min>max;
	//writeln(min,' ',max,' ',mid,' ',sum);
	sum:=0;
  	for i:=1 to m do
		inc(sum,min div a[i]+1);
	j:=sum-n+1;t:=0;
	for i:=m downto 1 do
		if min mod a[i] =0 then
			begin
			inc(t);
			if t=j then
				break;
			end;
	writeln(i);
end.
