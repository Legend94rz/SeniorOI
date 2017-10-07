program pa;
uses
	math;
const
	num:array[1..20]of int64=(9,9,90,90,900,900,9000,9000,90000,90000,900000,900000,9000000,9000000,90000000,90000000,900000000,900000000,9000000000,9000000000);
var
	i,j,p:longint;
	n,t:longint;
	tot,ans:int64;
	s:string;
begin
	{assign(output,'test.txt');rewrite(output);
	for i:=1 to 20 do
		write(9*10**((i div 2)-(i mod 2 xor 1)),',');
	close(output);}
	assign(input,'palindrome.in');reset(input);assign(output,'palindrome.out');rewrite(output);
	readln(n);t:=n;
	for I:=1 to 20 do
		begin
			if n>num[i] then
				dec(n,num[i])
			else
				break;
			inc(tot,NUM[i]);
		End;
	p:=i;
	//writeln(p,' ',tot);
	ans:=10**((p div 2)-(p mod 2 xor 1))+t-tot;
	//writeln(ans);
	str(ans,s);
	j:=length(s)-p mod 2;
	for i:=j downto 1 do
		s:=s+s[i];
	writeln(s);
	close(output);
end.
