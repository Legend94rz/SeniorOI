var
	i,j,n,m1,m2,a1,b1,a2,b2,t:longint;
	f:array[0..100001,0..3,0..3,0..3,0..3]of longint;
	s:array[0..100001]of longint;
	c:char;
function cal(a,b,c:longint):longint;
begin
	if c=0 then c:=a;
	if b=0 then b:=a;
	if (a<>b)and(a<>c)and(b<>c) then exit(3);
	if (a=b)and(b=c) then exit(1);
	if (a=b)or(b=c)or(a=c) then exit(2);
end;
{function cal(o,p,t:longint):longint;
begin
     if p=0 then p:=o;
     if t=0 then t:=o;
     if o=p then if p=t then exit(1);
     if o=p then if p<>t then exit(2);
     if o=t then if t<>p then exit(2);
     if p=t then if o<>p then exit(2);
     if o<>p then if p<>t then if t<>o then exit(3);
end;}
begin
    readln(n);
	for i:=1 to n do
		begin
	        read(c);
			case c of
				'M':s[i]:=1;
				'F':s[i]:=2;
				'B':s[i]:=3;
				end;
        end;
	fillchar(f,sizeof(f),$80);f[0,0,0,0,0]:=0;
	for i:=1 to n do
		for a1:=0 to 3 do
			for a2:=0 to 3 do
				for b1:=0 to 3 do
					for b2:=0 to 3 do
						if (f[i-1,a1,a2,b1,b2]>=0) then
							begin
								t:=f[i-1,a1,a2,b1,b2];
                                m1:=cal(s[i],a1,a2);
                                m2:=cal(s[i],b1,b2);
								if t+m1>f[i,s[i],a1,b1,b2] then
									    f[i,s[i],a1,b1,b2]:=t+m1;
								if t+m2>f[i,a1,a2,s[i],b1] then
									    f[i,a1,a2,s[i],b1]:=t+m2;
               				end;
	t:=-maxlongint;
	for a1:=0 to 3 do
		for a2:=0 to 3 do
			for b1:=0 to 3 do
				for b2:=0 to 3 do
					if f[n,a1,a2,b1,b2]>t then
						t:=f[n,a1,a2,b1,b2];
	writeln(t);

end.
