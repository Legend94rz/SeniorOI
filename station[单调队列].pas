type
	node=record
		no,d:longint;
		end;
var
	i,j,n,m,l,r:longint;
	v,h:array[0..1000001]of longint;
	q:array[0..2000001]of node;
	energy:array[0..1000001]of int64;
	ans:int64;
begin
	assign(input,'station.in');reset(input);assign(output,'station.out');rewrite(output);
	readln(n);
	for i:=1 to n do readln(h[i],v[i]);
	l:=0;r:=0;
	for i:=1 to n do
		begin
			while (q[r].d<h[i])and(l<r)do begin energy[i]:=energy[i]+v[q[r].no];dec(r);end;
			inc(r);q[r].d:=h[i];q[r].no:=i;
        end;
	l:=0;r:=0;
	for i:=n downto 1 do
		begin
			while (q[r].d<h[i])and(l<r) do begin energy[i]:=energy[i]+v[q[r].no];dec(r);end;
			inc(r);q[r].d:=h[i];q[r].no:=i;
        end;
	for i:=1 to n do if energy[i]>ans then ans:=energy[i];
	writeln(ans);
	close(output);
end.

