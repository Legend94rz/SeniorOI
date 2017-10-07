{
Author: Huaxing DONG
	@ Laiwu No.1 High School
	08/03/2011
}
const
	maxn	=100000+5;
	inf	=maxlongint shr 1;

var
	f		:array[0..maxn,0..3,0..3,0..3,0..3]of longint;
	ch		:array[0..maxn]of char;
	n,ans		:longint;
	i,j,k,p,q	:longint;

	function pos(ch:char):longint;
	begin
		case ch of
		'M':	exit(1);
		'B':	exit(2);
		'F':	exit(3);
		end;
	end;

	function max(a,b:longint):longint;
	begin
		if a>b then exit(a);
		exit(b);
	end;

	function value(i,j,k:longint):longint;
	var
		num	:array[0..3]of boolean;
		ret	:longint;
	begin
		ret:=0;
		fillchar(num,sizeof(num),0);

		inc(ret,ord((not num[i])and(i<>0)));
		num[i]:=true;
		inc(ret,ord((not num[j])and(j<>0)));
		num[j]:=true;
		inc(ret,ord((not num[k])and(k<>0)));
		num[k]:=true;

		exit(ret);
	end;

begin
	//assign(input,'miners.in');reset(input);
	//assign(output,'miners.out');rewrite(output);

	readln(n);
	for i:=1 to n do
		read(ch[i]);

	ans:=-inf;
	for i:=0 to n do
	for j:=0 to 3 do
	for k:=0 to 3 do
	for p:=0 to 3 do
	for q:=0 to 3 do
		f[i,j,k,p,q]:=-inf;
	f[0,0,0,0,0]:=0;

	for i:=1 to n do
	for j:=0 to 3 do
	for k:=0 to 3 do
	for p:=0 to 3 do
	for q:=0 to 3 do
	if f[i-1,j,k,p,q]<>-inf then
	begin
		f[i,k,pos(ch[i]),p,q]:=max(f[i,k,pos(ch[i]),p,q],f[i-1,j,k,p,q]+value(j,k,pos(ch[i])));
		f[i,j,k,q,pos(ch[i])]:=max(f[i,j,k,q,pos(ch[i])],f[i-1,j,k,p,q]+value(p,q,pos(ch[i])));

		ans:=max(ans,f[i,k,pos(ch[i]),p,q]);
		ans:=max(ans,f[i,j,k,q,pos(ch[i])]);
	end;

	writeln(ans);

	//close(input);close(output);
end.
