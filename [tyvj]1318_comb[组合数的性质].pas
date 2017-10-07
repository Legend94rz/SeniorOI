const
	p=22222223;
type
	arr=array[-1..301]of int64;
var
	i,j,n,m,la,count:longint;
	a,b:arr;
	s:ansistring;
	ch:char;
operator /(a:arr;b:longint)ans:arr;
var
	i,r:longint;
begin
	for i:=la downto 1 do
		begin
			r:=a[i]mod b;
			a[i]:=a[i]div b;
			a[i-1]:=a[i-1]+10*r;
        end;
	while (a[la]=0)and(la>0) do dec(la);
	ans:=a;
end;
operator -(a,b:arr)ans:arr;
var
	i:longint;
begin
	if a[1]>=1 then
		dec(a[1])
	else
		for i:=1 to la do
			begin
				if a[i]<b[i] then
					begin
						dec(a[i+1]);inc(a[i],10);
                	end;
				dec(a[i],b[i]);
       	 	end;
	while (a[la]=0)and(la>0) do dec(la);
	ans:=a;
end;
function qmi(a,b:int64):int64;
begin
	qmi:=1;
	while b>0 do
		begin
			if (b and 1=1) then qmi:=(int64(qmi*a))mod p;
			a:=(int64(a*a))mod p;
			b:=b shr 1;
		end;
end;
begin
	while not eof do
		begin
			la:=0;count:=0;
			readln(s);b[1]:=1;
			for i:=length(s) downto 1 do
				begin
					inc(la);a[la]:=ord(s[i])-48;
                end;
			while la>0 do
				begin
                    if (a[1]and 1=1) then begin a:=a-b;inc(count);end;
					a:=a/2;
                end;
			writeln(qmi(2,count));
        end;
end.

