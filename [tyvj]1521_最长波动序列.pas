{
һ��ֱ�׵Ľ��ۣ���������еĳ���ֻ�벨�塢�����й�;
ɾ��ԭ���������ڲ�������Ԫ�ص�����ǰ���ĺ��֮��(�������������������֮��)��Ԫ�ز��ı䲨�����еĳ��ȡ�
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
