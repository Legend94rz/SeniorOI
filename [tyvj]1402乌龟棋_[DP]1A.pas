var
	i,j,n,m:longint;
	r:array[1..4]of longint;
	j1,j2,j3,j4:longint;
	a:array[0..1001]of longint;
	f:array[0..40,0..40,0..40,0..40]of longint;
begin
	readln(n,m);
	for i:=1 to n do read(a[i]);
	for i:=1 to m do begin read(j);inc(r[j]);end;
	f[0,0,0,0]:=a[1];
    for j1:=0 to r[1] do
		for j2:=0 to r[2] do
			for j3:=0 to r[3] do
				for j4:=0 to r[4] do
					if (j1+j2+j3+j4>0) then
						begin
							if j1>0 then if f[j1-1,j2,j3,j4]>f[j1,j2,j3,j4] then f[j1,j2,j3,j4]:=f[j1-1,j2,j3,j4];
							if j2>0 then if f[j1,j2-1,j3,j4]>f[j1,j2,j3,j4] then f[j1,j2,j3,j4]:=f[j1,j2-1,j3,j4];
							if j3>0 then if f[j1,j2,j3-1,j4]>f[j1,j2,j3,j4] then f[j1,j2,j3,j4]:=f[j1,j2,j3-1,j4];
							if j4>0 then if f[j1,j2,j3,j4-1]>f[j1,j2,j3,j4] then f[j1,j2,j3,j4]:=f[j1,j2,j3,j4-1];
							inc(f[j1,j2,j3,j4],a[j1+2*j2+3*j3+4*j4+1]);
                        end;
	writeln(f[r[1],r[2],r[3],r[4]]);
end.

