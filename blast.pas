var
	f:array[0..2000,0..2000]of longint;
	a,b:array[1..2000]of char;
	i,j,k,t,la,lb:longint;
        n,m:array[1..2000]of longint;
begin
        while not eoln do
                begin
                        inc(la);
                        read(a[la]);
                        n[la]:=ord(a[la]);

                end;
        readln;
        while not eoln do
                begin
                        inc(lb);
                        read(b[lb]);
                        m[lb]:=ord(b[lb]);
                end;
        readln;
        readln(k);
	f[0,0]:=0;
        for i:=1 to la do
		f[i,0]:=k+f[i-1,0];
	for i:=1 to lb do
		f[0,i]:=k+f[0,i-1];
        for i:=1 to la do
                for j:=1 to lb do
		begin
			f[i,j]:=abs(n[i]-m[j])+f[i-1,j-1];
			t:=k+f[i-1,j];
			if (f[i,j]>t)then f[i,j]:=t;
			t:=k+f[i,j-1];
			if(f[i,j]>t)then f[i,j]:=t;
		end;
        writeln(f[la,lb]);
end.
