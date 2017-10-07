{
id:rz109291
PROG:lamps
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: lamps
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 300 KB]
   Test 2: TEST OK [0.000 secs, 300 KB]
   Test 3: TEST OK [0.000 secs, 300 KB]
   Test 4: TEST OK [0.000 secs, 300 KB]
   Test 5: TEST OK [0.000 secs, 300 KB]
   Test 6: TEST OK [0.000 secs, 300 KB]
   Test 7: TEST OK [0.000 secs, 300 KB]
   Test 8: TEST OK [0.000 secs, 300 KB]

All tests OK.
Your program ('lamps') produced all correct answers!  This is your
submission #9 for this problem.  Congratulations!
}
var
	i,j,n,m,limit,t,r:longint;
	a,b,c,d:byte;
	on,off,light:array[0..101]of longint;
	ln,lf:longint;
	flag:boolean;
	q:array[0..100]of string;
function max(a,b:byte):byte;
begin
	if a>b then exit(a);
	exit(b);
end;
function hash:string;
var
	i,j,t:byte;
begin
	hash:='';
	for i:=1 to 6 do
		hash:=hash+(chr(light[i]+48));
end;
function app:boolean;
var
	i:byte;
	j:string;
begin
	j:=hash;
	for i:=1 to r do
		if q[i]=j then
			exit(true);
	exit(false);
end;
procedure check(a,b,c,d:byte);
var
	i,j:longint;
	t:string;
begin
	if a+b+c+d>limit then exit;
	if a=1 then
		for i:=1 to 6 do
			light[i]:=light[i] xor 1;
	if c=1 then
		for i:=1 to 6 do
			if i in[2,4,6] then
				light[i]:=light[i] xor 1;
	if b=1 then
		for i:=1 to 6 do
			if i in[1,3,5] then
				light[i]:=light[i] xor 1;
	if d=1  then
		for i:=1 to 6 do
			if i in[1,4,7] then
				light[i]:=light[i] xor 1;
        {for i:=1 to 6 do
                write(light[i]);
        writeln; }
        for i:=1 to ln do
		begin
			j:=on[i] mod 6;
			if j=0 then j:=6;
			if light[j]<>1 then
				begin
				//writeln(' not_on');
				exit;
				end;
		end;
	for i:=1 to lf do
		begin
			j:=off[i]mod 6;
			if j=0 then j:=6;
			if light[j]<>0 then
				begin
				//writeln(' not_off');
				exit;
				end;
		end;
	if app then  begin {writeln('app');}exit;end;
	flag:=true;
	t:=hash;j:=r;
	while (t<q[j])and(j>0) do
		begin
			q[j+1]:=q[j];
			dec(j);
		end;
	q[j+1]:=t;
        r:=r+1;
end;
procedure print;
begin
	for i:=1 to r do
		begin
			for j:=1 to n div 6 do
				write(q[i]);
			for j:=1 to n mod 6 do
				write(q[i,j]);
			writeln;
		end;
end;
begin
	assign(input,'lamps.in');reset(input);assign(output,'lamps.out');rewrite(output);
	readln(n);
	readln(limit);
        if limit>4 then
			begin
				{limit:=limit mod 4;
				if limit=0 then }
					limit:=4;
			end;
	read(on[1]);
	i:=1;
	while on[i]<>-1 do
		begin
		inc(i);
		read(on[i]);
		end;
	ln:=i-1;
	i:=1;
	read(off[1]);
	while off[i]<>-1 do
		begin
			inc(i);
			read(off[i]);
		end;
	lf:=i-1;
	{for i:=1 to ln do
			write(on[i],' ');
	writeln;
	for i:=1 to lf do
			write(off[i],' ');
	writeln;}
	//if limit=0 then t:=0 else t:=1;
	for a:=1 downto 0 do
		for b:=1 downto 0 do
			for c:=1 downto 0 do
				for d:=1 downto 0 do
					begin
						for i:=1 to 6 do
							light[i]:=1;
						//writeln(a,b,c,d);
						check(a,b,c,d);
					end;
	if not flag then writeln('IMPOSSIBLE');
	print;
	close(input);close(output);
end.
