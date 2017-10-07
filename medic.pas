var
	f:array[0..1000]of longint;
	i,j,m,tm:longint;
	w,t:array[0..501]of longint;
begin
	assign(input,'medic.in');reset(input);assign(output,'medic.out');rewrite(output);
	readLN(tm,m);
	for i:=1 to m do
		readln(t[i],w[i]);
	for i:=1 to m do
		for j:= tm downto 0 do
			if(j>=t[i])then
				if(f[j-t[i]]+w[i]>f[j])then
					f[j]:=f[j-t[i]]+w[i];
	writeln(f[tm]);
	close(input);close(output);
end.
