type
	arr=array[0..1000]of int64;
var
	a,b:arr;
	i,j,n,k,la,t:longint;
begin
	readln(n);
	fillchar(b,sizeof(b),0);
	for j:=1 to n do
	begin
		for i:=1 to 1000 do
			a[i]:=-1;
		a[1]:=1;la:=1;
		for k:=1 to j do
			begin
				for i:=1 to la do
					a[i]:=a[i]*k;
				for i:=1 to la do
					begin
						if a[i+1]=-1 then a[i+1]:=0;
						a[I+1]:=a[i+1]+a[i] div 10;
						a[i]:=a[i] mod 10;
					end;
				t:=a[la+1];
				while t>0 do
					begin
						inc(la);
						a[la]:=t mod 10;
						t:=t div 10;
					end;
				while a[la]<>-1 do
					inc(la);
				LA:=LA-1;
			end;
			while a[la]=0 do
				dec(la);
			{write(j,' ');
			for k:=la downto 2 do
		        write(a[k]);
	        writeln(a[1]);}
		for k:=1 to la do b[k]:=b[k]+a[k];
	end;
	{for j:=la downto 2 do
		write(a[j]);
	writeln(a[1]);}
	for k:=1 to la do
		begin
			b[k+1]:=b[k+1]+b[k] div 10;
			b[k]:=b[k] mod 10;
		end;
	for i:=la downto 2 do
		write(b[i]);
	writeln(b[1]);
end.
