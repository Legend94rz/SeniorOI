{
一个直白的结论：最长波动序列的长度只与波峰、波谷有关;
删除原序列中属于波动序列元素的任意前驱的后继之间(即两个波峰或两个波谷之间)的元素不改变波动序列的长度。
}
var
	i,j,n,m,ans:Longint;
	a,b,c:longint;
begin
	readln(n);
	if n<=1 then begin readln(a);writeln(1);exit;end;
	read(a);read(b);if a<>b then ans:=1 else ans:=0;
	for i:=3 to n do
		begin
			read(c);if b=c then continue;
			if (a>b)and(b<c)or(a<b)and(b>c) then inc(ans);
			a:=b;b:=c;
        end;
	writeln(ans+1);
end.
