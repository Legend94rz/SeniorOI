const
	p:array[1..4]of int64=(100007,100000013,1000000113,11000000007);
var
	i,j,m,k:longint;
	s:ansistring;
	flag:boolean;
	a:array[1..4]of int64;
	f:array[0..100001,1..4]of int64;
begin
	readln(m);
	f[0,1]:=1;f[0,2]:=1;f[0,3]:=1;f[0,4]:=1;
    f[1,1]:=1;f[1,2]:=1;f[1,3]:=1;f[1,4]:=1;
	for i:=2 to 100001 do
		for j:=1 to 4 do
			f[i,j]:=(f[i-1,j]+f[i-2,j])mod p[j];
	for i:=1 to m do
		begin
			readln(s);fillchar(a,sizeof(a),0);
			for j:=1 to length(s) do
				for k:=1 to 4 do
					a[k]:=(a[k]*10+ord(s[j])-48)mod p[k];
			flag:=false;
			for j:=0 to 100001 do
				if (f[j,1]=a[1])and(f[j,2]=a[2])and(f[j,3]=a[3])and(f[j,4]=a[4]) then
					begin
						writeln(j);
						flag:=true;break;
					end;
			if not flag then writeln('lala');
        end;
end.

