var
	i,j,n,m,x,k:longint;
	f:array[0..101,0..10001]of boolean;
	a:array[0..101,0..101]of longint;
	l:array[0..101]of longint;
	t:boolean;
begin
	//assign(input,'tt.txt');reset(input);
	readln(n);
	for i:=1 to n do
		begin
			x:=0;
			while x<>-1 do begin inc(l[i]);read(x);a[i,l[i]]:=x;a[i,0]:=a[i,0]+x; end;
			dec(l[i]);inc(a[i,0]);
		end;
	for i:=0 to 101 do f[i,0]:=true;
	for k:=1 to n do
		for i:=1 to l[k] do
			for j:=a[k,0] downto a[k,i] do
				if f[k,j-a[k,i]] then
					f[k,j]:=true;
	for i:=10001 downto 1 do
		begin
			t:=true;
			for j:=1 to n do t:=t and f[j,i];
			if t then begin writeln(i);exit;end;
		end;
	writeln(0);
end.

