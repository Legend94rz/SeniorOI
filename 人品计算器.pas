const
	t='再';
var
	i,j:longint;
	s,k:string;
	
begin
	writeln('               人品计算器 v1.0');
	writeln('                             by 你哥，legend');
	i:=-1;
	repeat
		k:='';
		for j:=1 to i do
			k:=k+t;
		writeln(k,'输个人名:');
		inc(i);
		readln(s);
		if s='任震' then
			begin
				writeln(1000000);
				writeln('人品极佳，风流倜傥，前无古人后无来者');
				readln;
				writeln('滴一帅哥&&天才');
				continue;
			end;
		if s='刘鑫' then
			begin
				writeln(-1);
				writeln('不好意思，是负的......');
				readln;
				writeln('遵循人品守恒定律好好学学吧....');
				readln;
				writeln('尤其是像你哥那样的.....');
				readln;
			end
		else
			begin
				writeln(random(50)+1);
				writeln('一般般...');		
				readln;
			end;	
	until s='%%%';
end.