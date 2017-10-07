var
	i,j,n,m,la,l,r,mid,len:longint;
	f,a,b:array[0..100001]of longint;
	p:array[0..100001]of longint;
begin
	while true do
		begin
			readln(n);
			if n<>0 then
				begin
					fillchar(f,sizeof(f),0);la:=0;len:=0;
					for i:=1 to n do begin read(a[i]);p[i]:=i+1;end;
					for i:=n-1 downto 1 do
						if a[i]=a[i+1]-1 then
							p[i]:=p[i+1];
					i:=1;
					while i<=n do
						begin
							inc(la);
							b[la]:=a[i];
							i:=p[i];
                        end;
//					for i:=1 to la do write(b[i],' ');writeln;

					for i:=1 to la do
						begin
							//write('f ',b[i],':');
							l:=0;r:=len;
							repeat
								mid:=(l+r)shr 1;
								if f[mid]<b[i] then
									l:=mid+1
								else
									r:=mid-1;
							until l>r;
							f[l]:=b[i];
							if l>len then len:=l;//writeln(len);
						end;
					writeln(la-len);
				end
			else
				break;
		end;
end.

