{
������㷨�ǣ�
	��ɫ��ͬ����������Ե�����ͬһ����"1"��ɵ���ͨ����
	����ͳ����ͬһ��"1"����ͨ���У�ÿ����ɫ���ж��٣�
	��ô������һ����ͨ���һ����ɫ��˵(��������ɫ�������ͨ������x��)��������ĿҪ��ľ���C(x,2)��
}
var
	i,j,n,k,p,x,y:longint;
	a:array[0..200001]of boolean;
	color:array[0..200001]of longint;
	m:array[0..51]of longint;
	ans:int64;
begin
	readln(n,k,p);
	for i:=1 to n do
		begin
			readln(x,y);
			a[i]:=y>p;
			color[i]:=x;inc(m[x]);
		end;
	for i:=0 to k-1 do ans:=ans+m[i]*(m[i]-1) shr 1;
	fillchar(m,sizeof(m),0);
	for i:=1 to n+1 do
		if a[i] then
			inc(m[color[i]])
		else
			begin
				for j:=0 to k-1 do ans:=ans-(m[j]-1)*m[j] shr 1;
				fillchar(m,sizeof(m),0);
			end;
	writeln(ans);
end.
