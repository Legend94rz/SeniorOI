{
0:119
1:18 or 36
2:93
3:91
4:58
5:107
6:111
7:82
8:127
9:123
}
{
0 ~ {0, 1, 2, 4, 5, 6}	6
1 ~ {2, 5} or {1, 4}	2
2 ~ {0, 2, 3, 4, 6} 	5
3 ~ {0, 2, 3, 5, 6}		5
4 ~ {1, 2, 3, 5}		4
5 ~ {0, 1, 3, 5, 6}		5
6 ~ {0, 1, 3, 4, 5, 6}	6
7 ~ {0, 2, 5}			3
8 ~ {0, 1, 2, 3, 4,5,6}	7
9 ~ {0, 1, 2, 3, 5, 6}	6
}
const
	//						 0 1 2 3 4 5 6 7 8 9
	d:array[0..9]of longint=(6,2,5,5,4,5,6,3,7,6);
	w:array[0..9]of longint=(119,0,93,91,58,107,111,82,127,123);//注意1，改！
var
	i,j,n,p,t,ans:longint;
	x:array[1..3]of longint;
	s:string;
	sx:array[1..3]of string;
	tx:array[1..3]of longint;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
function cal(u:longint):longint;
begin
	//write('cal ',u,' ');
	cal:=0;
	while u>0 do
		begin
			if u and 1=1 then inc(cal);
			u:=u shr 1;
		end;
	exit(cal);
	//writeln(cal);
end;
function check(a,b:longint):longint;
var
	sum,count,i,j,u,ta:longint;
	ts:array[1..3]of string;

begin
	count:=0;sum:=a+b;
	str(a,ts[1]);str(b,ts[2]);str(sum,ts[3]);
	if (length(ts[1])<>length(sx[1]))or(length(ts[2])<>length(sx[2]))or(length(ts[3])<>length(sx[3])) then
        exit(maxlongint);//位数不同直接退出！
	//计算a,b,sum用的火柴数:
	fillchar(tx,sizeof(tx),0);
	for i:=1 to 3 do
		begin
			for j:=1 to length(ts[i]) do
				inc(tx[i],d[ord(ts[i,j])-48]);
			inc(count,tx[i]);
		end;
	if count<>n then exit(maxlongint);//多了少了都退出！

	//writeln('p:    ',a,' ',b,' ',sum);
	//writeln('c per:',tx[1],' ',tx[2],' ',tx[3]);

	ta:=0;
	for i:=1 to 3 do
		begin
		for j:=1 to length(ts[i])do
			begin
				if (ts[i,j]<>'1')and(sx[i,j]<>'1') then begin {writeln(ord(ts[i,j])-48,' & ',ord(sx[i,j])-48);}u:=cal(w[ord(ts[i,j])-48]xor w[ord(sx[i,j])-48]);end;
				if (ts[i,j]<>'1')and(sx[i,j]='1') then 	begin {writeln(ord(ts[i,j])-48,' & ',ord(sx[i,j])-48);}u:=min(cal(w[ord(ts[i,j])-48]xor 18),cal(w[ord(ts[i,j])-48]xor 36));end;//
				if (ts[i,j]='1')and(sx[i,j]<>'1') then 	begin {writeln(ord(ts[i,j])-48,' & ',ord(sx[i,j])-48);}u:=min(cal(18 xor w[ord(sx[i,j])-48]),cal(36 xor w[ord(sx[i,j])-48]));end;
				if (ts[i,j]='1')and(sx[i,j]='1') then u:=0;
				//write('ta=',ta,'+',u,'=');
				inc(ta,u);
				//writeln(ta);
			end;
		//write(ta,'->');
		end;
	//writeln;
	//writeln('ta=',ta);
	exit(ta div 2);
end;
begin
	//writeln(93 xor 127,' ',58 xor 18);
	readln(s);s:=s+' ';
	while length(s)>0 do
		begin
			inc(i);
			p:=pos(' ',s);sx[i]:=copy(s,1,p-1);delete(s,1,p);
		end;
	//for i:=1 to 3 do writeln(sx[i],'*');
	for i:=1 to 3 do
		begin
			for j:=1 to length(sx[i]) do
				inc(x[i],d[ord(sx[i,j])-48]);
			inc(n,x[i]);//总共的火柴数
		end;

	{for i:=1 to 3 do write(x[i],' ');
	writeln;}

	//check(4,8);
	ans:=maxlongint shr 1;
	for i:=0 to 1000 do
		for j:=0 to 1000 do
			begin
				t:=check(i,j);
				if t<ans then ans:=t;
            end;
	writeln(ans);
end.

