var
	k,i,j,n:longint;
	b,a:array[0..100001]of longint;
	ch:char;
begin
	while not eoln do
		begin
			inc(i);
	    	read(ch);
			a[i]:=ord(ch)-48;
		end;
	n:=i;
	readln(b[1]);write(b[1]);
	k:=a[1] xor b[1];
	for i:=2 to n do
		begin
    		b[i]:=(a[i] xor k)mod 10;
			write(b[i]);
		end;
	writeln;
end.


