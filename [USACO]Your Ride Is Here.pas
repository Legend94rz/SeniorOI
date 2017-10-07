{
ID: rz109291
PROG: ride
LANG: PASCAL
}
Program ride;
const
	a:array['A'..'Z']of longint=(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
var
	s1,s2:string;
	i,j:longint;
	sum:longint;
	e,f:longint;
begin
	assign(input,'ride.in');reset(input);assign(output,'ride.out');rewrite(output);
	readln(s1);
	readln(s2);
	sum:=1;
	for i:=1 to length(s1) do
		sum:=sum*a[s1[i]];
	e:=sum mod 47;
	sum:=1 ;
	for i:=1 to length(s2) do
		sum:=sum*a[s2[i]];
	f:=sum mod 47;
	if e<>f then writeln('STAY') else writeln('GO');
	close(input);
	close(output);
end.
