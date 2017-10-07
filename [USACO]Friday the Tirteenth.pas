{
ID:rz109291
PROG:friday
LANG:PASCAL
}
Program friday;
const
	day:array[1..12]of longint=(31,28,31,30,31,30,31,31,30,31,30,31);
var
	w,y,m,d,n,te:longint;
	bol:boolean;
	a:array[0..8]of longint;
	i,j,days:longint;
function getdays(year,mouth:longint):longint;
begin
	if ((year mod 100<>0)and(year mod 4 =0)or (year mod 100=0)and(year mod 400=0))and(mouth=2) then
			exit(29)
		else
			exit(day[mouth]);
end;
begin
	assign(input,'friday.in');assign(output,'friday.out');reset(input);rewrite(output);
	readln(n);te:=0;
	for y:=1900 to 1900+n-1 do
		begin
			for m:=1 to 12 do
				begin
				days:=getdays(y,m);
				for d:=1 to days do
					begin
					inc(te);
					if te=8 then te:=1;
					if d=13 then inc(a[te]);
					end;
				end;
		end;
	write(a[6],' ',a[7]);
	for i:=1 to 5 do
		write(' ',a[i]);
	writeln;
	close(input);close(output);
end.