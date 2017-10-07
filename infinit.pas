var
	s:array[0..3]of ansistring;
	i,j,n,m,q:longint;
        a,b:qword;
	f,ft:array[0..100]of qword;
function find(x:qword):qword;
var
	i:longint;
begin
	if x=0 then exit(0);
	find:=0;
	for i:=1 to 92 do
		if f[i]>=x then
			break;
	if f[i]=x then
		exit(ft[i]);
	exit(ft[i-1]+find(x-f[i-1]));
end;
begin
	assign(input,'infinit.in');reset(input);
	assign(output,'infinit.out');rewrite(output);
	readln(q);
	ft[0]:=0;ft[1]:=1;
	f[0]:=1;f[1]:=1;
	for i:=2 to 92 do
		begin
			f[i]:=f[i-1]+f[i-2];
			ft[i]:=ft[i-1]+ft[i-2];
		end;
	for i:=1 to q do
		begin
			readln(a,b);
			writeln(find(b)-find(a-1));
		end;
	close(input);close(output);
end.
