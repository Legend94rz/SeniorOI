var
	i,j,n,m,x,y,ans,k,f1,f2:longint;
	s1,s2:string;
	t:string;
	b:array[0..15000] of boolean;
	rela:array['a'..'z']of char;
	father:array[0..15000] of longint;
function getfather(x:longint):longint;
var
	c,t,f:longint;
begin
	t:=x;
	while (father[x]<>x) do x:=father[x];
	c:=x;
	while father[t]<>c do
		begin
			f:=father[t];
			father[t]:=c;
			t:=f;
		end;
end;
begin
	readln(s1);
	readln(s2);
	for i:=1 to 26 do
		rela[s1[i]]:=s2[i];
	readln(n,m);
	for i:=1 to m do
		begin
			readln(k,t);
			delete(t,1,1);
			for j:=1 to length(t) do
				t[j]:=rela[t[j]];
			if pos('poison',t)<>0 then
				b[k]:=true;
		end;
	for i:=1 to n do father[i]:=i;
	readln(m);
	for i:=1 to m do
		begin
			readln(x,y);
			f1:=getfather(x);
			f2:=getfather(y);
			father[f2]:=f1;
			if b[f2] then b[f1]:=true;
		end;
	for i:=1 to n do
		if not b[getfather(i)] then
			inc(ans);
	writeln(ans);
end.
