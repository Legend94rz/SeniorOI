var
	i,j,l,r:longint;
	n,x:longint;
	mid:int64;
begin
	assign(input,'func.in');reset(input);assign(output,'func.out');rewrite(output);
	readln(n);
	l:=0;r:= 2000000000;
	if n=1  then begin writeln(1);close(output);halt;end;
	repeat
		mid:=(l+r) shr 1;
		if trunc(mid*ln(mid)/ln(10))+1>n then
			r:=mid-1
		else
			if trunc(mid*ln(mid)/ln(10))+1<n then
				l:=mid+1
			else
				begin
				writeln(mid);
				close(output);
				halt;
				end;
	until l>r;
	writelN(l);
	close(input);close(output);
end.
