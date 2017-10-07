var
	s1,s2:string;
	i,j,a,b:longint;
	n,m:array[0..200]of longint;
	f:array[0..200,0..200]of longint;
	d:array['A'..'Z','A'..'Z']of longint;
function max(a,b,c:longint):longint;
begin
	max:=-maxlongint;
	if a>max then max:=a;
	if b>max then max:=b;
	if c>max then max:=c;
end;
begin
	d['A','A']:=5;d['A','C']:=-1;d['A','G']:=-2;d['A','T']:=-1;D['A','Z']:=-3;
	D['C','A']:=-1;D['C','C']:=5;D['C','G']:=-3;D['C','T']:=-2;D['C','Z']:=-4;
	d['G','A']:=-2;D['G','C']:=-3;D['G','G']:=5;D['G','T']:=-2;D['G','Z']:=-2;
	D['T','A']:=-1;D['T','C']:=-2;D['T','G']:=-2;D['T','T']:=5;D['T','Z']:=-1;
	D['Z','A']:=-3;D['Z','C']:=-4;D['Z','G']:=-2;D['Z','T']:=-1;
	readln(a,s1);
	readln(b,s2);
	delete(s1,1,1);delete(s2,1,1);
	for i:=1 to a do
		f[i,0]:=f[i-1,0]+d[s1[i],'Z'];
	for i:=1 to b do
	    f[0,i]:=f[0,i-1]+d['Z',s2[i]];
	FOR I:=1 to a do
		for j:=1 to b do
			f[i,j]:=max(f[i-1,j-1]+d[s1[i],s2[j]],f[i-1,j]+d[s1[i],'Z'],f[i,j-1]+d['Z',s2[j]]);
	writeln(f[a,b]);
end.
