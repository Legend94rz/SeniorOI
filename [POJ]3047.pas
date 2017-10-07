const
	day:array[1..7]of string=('monday','tuesday','wednesday','thursday','friday','saturday','sunday');
	eachmonthdays:array[1..12]of integer=(31,28,31,30,31,30,31,31,30,31,30,31);
var
	i,j:longint;
	y1,y2,d1,d2,m1,m2,t,m,d:longint;
	lynum:longint;
	days,r:longint;
function leap(i:longint):boolean;
begin
	if(i mod 4=0)and(i mod 100<>0)or((i mod 400=0)and(i mod 100=0))then
		exit(true);
	exit(false);
end;
begin
	readlN(y1,m1,d1);
	for i:=1 to m1-1 do
		if(leap(y1))and(i=2)then inc(days,29)
		else
			if(leap(y1))and(i<>2)or(not leap(y1))then
				inc(days,eachmonthdays[i]);
	for i:=1 to d1-1 do
		inc(days);
	lynum:=trunc(y1-1) + (Y1-1)div 4 - (Y1-1)div 100 + (Y1-1)div 400 + days ;
	r:=(lynum+1) mod 7;
	if r=0 then
		writeln(day[7])
	else
		writeln(day[r]);
end.