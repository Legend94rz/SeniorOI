program ty1046;
uses
	math;
var
	k,i,j:longint;
	f:array[0..2000,0..2000]of longint;
	s1,s2:ansistring;
begin
	readln(s1);
	readln(s2);
	readln(k);
	for i:=1 to length(s1) do
		f[i,0]:=k+f[i-1,0];
	for j:=1 to length(s2) do
		f[0,j]:=k+f[0,j-1];
	for i:=1 to length(s1) do
		for j:=1 to length(s2) do
			f[i,j]:=min(f[i-1,j-1]+abs(ord(s1[i])-ord(s2[j])),min(f[i,j-1]+k,f[i-1,j]+k));
	writeln(f[length(s1),length(s2)]);
end.
