var
	a,f:array[0..10000]of longint;
	i,j,n,k:longint;
	l,r,mid:longint;
	top:longint;
procedure print;
var
	i:longint;
begin
	write('f: ');
	for i:=1 to top-1 do
		write(f[i],' ');
	writeln(f[top]);
end;
begin
	//assign(input,'input.txt');reset(input);assign(output,'output.txt');rewrite(output);
	readln(n);
	for i:=1 to n do
		read(a[i]);
	fillchar(f,sizeof(f),$3f);
	f[0]:=-1000000;
	for i:=1 to n do
		begin
			if a[i]>=f[top] then begin inc(top);f[top]:=a[i];{print;}continue;end;
			if (a[i]<f[1]) then begin f[1]:=a[i];{print;}continue;end;
			l:=1;r:=top;
			repeat
				mid:=(l+r)shr 1;
				if f[mid]<=a[i] then
					l:=mid+1
				else
					r:=mid-1;
			until l>r;
			f[l]:=a[i];//print;writeln('l: ',l,' mid: ',mid,' r: ',r);
        end;
	writeln(top);
	//close(output);
end.

