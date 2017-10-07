var
	i,m,n,mon:longint;
	a:array[0..100002] of longint;
	max,min,mid,s:int64;
begin
	//assign(input,'test.txt');reset(input);assign(output,'tout.txt');rewrite(output);
	//while not eof do  begin
	readln(n,m);
	min:=0;
	max:=0;
	fillchar(a,sizeof(a),0);
	for i:=1 to n do
		begin
			readln(a[i]);
			if a[i]>min then
				min:=a[i];
			inc(max,a[i]);
		end;
	while min<=max do
		begin
			mid:=(min+max)shr 1;
			s:=0;mon:=1;
			for i:=1 to n do
				if s+a[i]<=mid then
					inc(s,a[i])
				else
					begin
						inc(mon);
						s:=a[i];
					end;
			if mon>m then
				min:=mid+1
			else
				max:=mid-1;
		end;
        writeln(min);
	//end;close(output);
end.
