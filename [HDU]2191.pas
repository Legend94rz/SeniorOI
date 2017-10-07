var
	c,m,n,p:longint;
	u,i,j:longint;
	val,v,k:array[0..300]of longint;
	f:array[0..1000]of longint;
procedure mutiplepack(cost,value,ki:longint);
var
	i,j,t:longint;
begin
	t:=1;
	while ki>0 do
		begin
			if t>ki then t:=ki;
			ki:=ki-t;
			for i:=n downto cost*t do
				if f[i-cost*t]+value*t>f[i] then
					f[i]:=f[i-cost*t]+value*t;
			t:=t*2;
		end;
end;
begin
	readln(c);
	for u:=1 to c do
		begin
			fillchar(v,sizeof(v),0);
			fillchar(val,sizeof(val),0);
			fillchar(k,sizeof(k),0);
			fillchar(f,sizeof(f),0);
			readln(n,m);
			for i:=1 to m do
				readln(v[i],val[i],k[i]);
			for i:=1 to m do
				mutiplepack(v[i],val[i],k[i]);
			writeln(f[n]);
		end;
end.
