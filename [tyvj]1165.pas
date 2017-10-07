program ty1165;
uses
	math;
var
	i,j:Longint;
	p,d:longint;
	n:double;
	s,a:string;
procedure gets(a:string;var d:longint;var s:string);
var
	i,p:longint;
	flag:boolean;
begin
	flag:=false;
	if a[1]='-' then
		begin
			flag:=true;
			delete(a,1,1);
		end;
	i:=1;
	p:=pos('.',a);
	if p<>0 then delete(a,p,1)else p:=length(a)+1;
	while (a[i]='0')or(a[i]='.') do
		inc(i);
	inc(i);
	if i<=length(a) then insert('.',a,i) else a:=a+'.';
	d:=p-i;
	while (a[1]='0')and(length(a)>1) do delete(a,1,1);
	while ((a[length(a)]='0')or(a[length(a)]='.'))and(length(a)>1) do delete(a,length(a),1);
	s:=a;
	if flag then
		s:='-'+s;
end;
function conver(k:string):double;
var
	t,p:longint;
	f:boolean;
begin
	f:=false;p:=0;conver:=0;
	if k[1]='-' then
		begin
			delete(k,1,1);
			f:=true;
		end;
	p:=pos('.',k);if p=0 then p:=length(k);
	for i:=1 to length(k) do
		if k[i]<>'.' then
			conver:=conver+(ord(k[i])-48)*power(10,(p-i))
		else
			conver:=conver/10;
	if f then conver:=-conver;
	if conver=0 then conver:=0;
end;
procedure print(s:string;d:longint);
begin
	if s='' then s:='0';
	if (s<>'-1')and(s<>'1') then
		write(s,'*10')
	else
		if s='-1' then
			write('-10')
		else
			write('10');
	if (d<>1)and(d<>0) then
		if d<0 then
			writeln('^(',d,')')
		else
			writeln('^',d)
	else
		writeln;
end;
begin
	//assign(input,'test.in');reset(input);assign(output,'test.txt');rewrite(output);
	while not eof do
		begin
			readln(a);
			n:=conver(a);//write(n:0:6,'->');
			while (a[1]='0')and(length(a)>1) do delete(a,1,1);
			p:=pos('.',a);if p=0 then p:=length(a)+1;
			while ((a[length(a)]='.')or(a[length(a)]='0'))and(p<length(a)) do delete(a,length(a),1);
			if n=0 then a:='0';
			if a[length(a)]='.' then delete(a,length(a),1);
			if (n=0)or(abs(n)>=1)and(abs(n)<10) then begin writeln(a);continue;end;
			gets(a,d,s);print(s,d);
		End;
	//close(output);
end.

