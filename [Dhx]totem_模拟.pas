var
	i,j,n,m,k:longint;
	ch:array[-1025..1,-1025..1024]of char;
	mi:array[1..10]of longint=(2,4,8,16,32,64,128,256,512,1024);
begin
	assign(input,'totem.in');reset(input);assign(output,'totem.out');rewrite(output);
	readln(n);
	fillchar(ch,sizeof(ch),' ');
	ch[0,0]:='/';ch[0,1]:='\';
	ch[-1,-1]:='/';ch[-1,0]:='_';ch[-1,1]:='_';ch[-1,2]:='\';
	for k:=2 to n do
		for i:=0 downto 1-mi[k-1] do
			for j:=i to -i+1 do
				begin
					ch[i-mi[k-1],j-mi[k-1]]:=ch[i,j];
					ch[i-mi[k-1],mi[k-1]+j]:=ch[i,j];
				end;
	for i:=0 downto 1-mi[n] do
		begin
			for j:=1-mi[n] to 1-i do write(ch[i,j]);
			writeln;
		end;
	close(output);
end.

