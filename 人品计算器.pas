const
	t='��';
var
	i,j:longint;
	s,k:string;
	
begin
	writeln('               ��Ʒ������ v1.0');
	writeln('                             by ��磬legend');
	i:=-1;
	repeat
		k:='';
		for j:=1 to i do
			k:=k+t;
		writeln(k,'�������:');
		inc(i);
		readln(s);
		if s='����' then
			begin
				writeln(1000000);
				writeln('��Ʒ���ѣ��������Σ�ǰ�޹��˺�������');
				readln;
				writeln('��һ˧��&&���');
				continue;
			end;
		if s='����' then
			begin
				writeln(-1);
				writeln('������˼���Ǹ���......');
				readln;
				writeln('��ѭ��Ʒ�غ㶨�ɺú�ѧѧ��....');
				readln;
				writeln('�����������������.....');
				readln;
			end
		else
			begin
				writeln(random(50)+1);
				writeln('һ���...');		
				readln;
			end;	
	until s='%%%';
end.