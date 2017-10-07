var
	i,j:longint;
	f,b:array[0..2005001]of boolean;
	zs1,zs2:array[0..1000001]of longint;
	mm,ans:longint;
	low,high:array[0..1000001]of longint;
	q:array[0..101]of longint;
	w:array[0..101]of int64;
	nn,mmm,ttt,n,m:int64;
	r,l,count:longint;
function pow(a,b:longint):longint;
var
	i:longint;
begin
	pow:=1;
	for i:=1 to b do pow:=pow*a;
end;
begin
	//assign(input,'gcdlcm.in');reset(input);assign(output,'gcdlcm.out');rewrite(output);
	readln(n);readln(m);fillchar(f,sizeof(f),1);f[1]:=false;
	if m mod n<>0 then begin writeln(0);close(output);halt;end;mm:=m div n;
	j:=2;
	while mm>1 do
		begin
			while (mm mod j=0) do mm:=mm div j;
			if (mm<=1)or(j>=1000000) then break;
			inc(j);inc(count);
        end;
	writeln(pow(2,count));
	close(output);
end.

