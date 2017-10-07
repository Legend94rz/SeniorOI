program copy;
var
	i,j,k,f,n,m,l:longint;
	a:array[0..1000]of longint;
	s,min,max,mid:int64;
	flag:boolean;
begin
	assign(input,'copy.in');reset(input);assign(output,'copy.out');rewrite(output);
	readln(n,m);
	for i:=1 to n do
		begin
		read(a[i]);
		inc(s,a[i]);
		End;
	min:=0;max:=s;
	repeat
		mid:=(min+max)shr 1;s:=0;f:=0;flag:=false;
		for i:=1 to n do
			begin
				if a[i]>mid then begin flag:=true; break;end;
				inc(s,a[i]);
				if s>mid then
					begin
						inc(f);
						s:=a[i];
					end;
			End;
		if (f<m)and(not flag) then
			max:=mid-1
		else
			min:=mid+1;
	Until min>max;
	writeln(min{,' ',mid,' ',max});
	s:=0;l:=1;f:=1;
	for i:=1 to n do
		begin
			if (s+a[i]<=min)and(m-f<=n-i) then
				inc(s,a[i])
			else
				begin
					inc(f);
					writeln(l,' ',i-1);
					l:=i;
					s:=a[i];
				end;
		End;
	writeln(l,' ',i);
	close(output);
end.
