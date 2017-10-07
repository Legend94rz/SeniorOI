var
	n:longint;
        a:array[0..15]of longint=(1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768);
function fun(num:longint):string;
var
	I,tmp:longint;
	s:string;
begin
	if num>=4 then
	begin
		for i:=0 to 15 do
			if a[i]>num then
				break;
		tmp:=i-1;
		if a[tmp]=num then
			exit('2('+fun(tmp)+')')
		else
			if a[tmp]<num then
				exit('2('+fun(tmp)+')'+'+'+fun(num-a[tmp]));
	end;
	if num=3 then
		exit('2+2(0)');
	if num=2 then
		exit('2');
	if num=1 then
		exit('2(0)');
end;
begin
	readln(n);
	writeln(fun(n));
end.
