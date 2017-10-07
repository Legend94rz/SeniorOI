var
	d,p:array[0..200]of real;
	d1,c,d2:real;
        n,i:longint;
procedure qsort(s,t:longint);
var
	i,j:longint;
        k,y:real;
begin
	i:=s;j:=t;k:=d[(s+t) shr 1];
	repeat
		while d[j]>k do dec(j);
		while d[i]<k do inc(i);
		if i<=j then begin
			y:=d[i];d[i]:=d[j];d[j]:=y;
			y:=p[i];p[i]:=p[j];p[j]:=y;
			inc(i);dec(j);
		end;
	until i>j;
	if (i<t) then qsort(i,t);
	if (s<j) then qsort(s,j);
end;
procedure main;
var
	pre,t,i:longint;
	v,s,min:real;
begin
	pre:=0;v:=0;s:=0;
	repeat
		i:=pre+1;
		while (p[i]>p[pre])and(i<=n)and not (d[pre]+c*d2<d[i]) do
			inc(i);
		if (i<=n)and(d[pre]+c*d2>=d[i]) then
			begin
				if v>(d[i]-d[pre])/d2 then
					v:=v-(d[i]-d[pre])/d2
     			else
					begin
						s:=s+((d[i]-d[pre])/d2-v)*p[pre];
						v:=0;
					end;
				pre:=i;
			end
		else
			begin
				if d[pre]+c*d2>=d1 then
					begin
						s:=s+((d1-d[pre])/d2-v)*p[pre];
						writeln(s:0:2);
						exit;
					end;
				t:=0;min:=maxlongint;
				for i:=pre+1 to n do
					if d[pre]+c*d2<d[i] then
						break
					else
						if p[i]<min then
							begin
								min:=p[i];
								t:=i;
							end;
				if t=0 then
					begin
					writeln('No Solution');
					exit;
					end;
				s:=s+(c-v)*p[pre];
				V:=c;
				v:=v-(d[t]-d[pre])/d2;
				pre:=t;
			end;
	until false;
end;
begin
	readln(d1,c,d2,p[0],n);
	for i:=1 to n do
		readln(d[i],p[i]);
	qsort(1,n);
	main;
end.
