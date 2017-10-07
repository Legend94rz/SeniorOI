program box;
const
	s1='Escape is possible.';
	s2='Box cannot be dropped.';
var
	n,i:longint;
	a,b,x,y:longint;
	flag:boolean;
procedure swap(var a,b:longint);
var
	t:longint;
begin
	t:=a;a:=b;b:=t;
end;
begin
	//assign(input,'box.in');reset(input);assign(output,'box.out');rewrite(output);
	//writeln(cos(pi/2):0:3);
	while true do
		begin
			readln(a,b,x,y);
			if a>b then	swap(a,b);
			if x>y then swap(x,y);
			//writeln(a,' ',b,' ',x,' ',y);
			if (a=b)and(x=y)and(a=x)and(a=0) then break;
			flag:=false;
			for i:=0 to 90 do
				if (x*cos(i/180*pi)+y*sin(i/180*pi)<a)and(x*sin(i/180*pi)+y*cos(i/180*pi)<b)then
					begin
						//writeln('ok at ',i/180*pi:0:2,' ',x*cos(i/180*pi):0:1,'+',y*sin(i/180*pi):0:1,'<',a,';',x*sin(i/180*pi):0:1,'+',y*cos(i/180*pi):0:1,'<',b);
						flag:=true;
						break;
					end;
			if flag then
				writeln(s1)
			else
				writeln(s2);
		end;
	//close(output);
end.

