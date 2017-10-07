var
	f,beat:array[0..201,0..201]of boolean;
	win:array[1..201]of boolean;
	s:array[0..101]of string;
	count,i,j,m,k,l,n:longint;
	c:char;
begin
	assign(input,'mus.in');assign(output,'mus.out');reset(input);rewrite(output);
	readlN(n);
	m:=2*n;
	for i:=1 to n do
		readln(s[i]);
	for i:=1 to n do
		for j:=1 to n do
			if(s[i,j]='1')then
			begin
				beat[i,j]:=true;
				beat[i+n,j]:=true;
				beat[i,j+n]:=true;
				beat[i+n,j+n]:=true;
			end;
	for i:=1 to m-1 do
		begin
			f[i,i+1]:=true;
			f[i+1,i]:=true;
		end;
	for l:=3 to n do
		for i:=1 to m do
			begin
			j:=i+l-1;
			if(j>m)then break;
			for k:=i+1 to j-1 do
				if (f[i,k]and f[k,j] and (beat[i,k]or beat[j,k]))then
					begin
						f[i,j]:=true;
						f[j,i]:=true;
				        break;
				end;
			end;
	for i:=1 to n do
		for k:=i+1 to i+n-1 do
			if(f[i,k]and f[k,i+n]and beat[i,k])then
			begin
				win[i]:=true;
				inc(count);
				break;
			end;
	writeln(count);
	for i:=1 to n do
		if(win[i])then
			writeln(i);
	close(input);close(output);
end.
{
��n���˸���һ�ݣ��ӵ����棬���i�����ں����ⲿ���ǵ�i+n ��

��f[i,j]��ʾ��i�������j �����ܷ����棬��ʼ��f[i,i+1]=true,f[i+1,i]=true

i��j ��������i��ʤ���������ǣ���i��j�м����һ��kʹ��i����k������i�ܻ�ʤ��k����j������j�ܻ�ʤ

��beat[i,j]��ʾi�ܴ��j����f[i,j]=(f[i,k]and f[k,j] and (beat[i,k]or beat[j,k]))
}






