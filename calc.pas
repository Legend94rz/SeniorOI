type
	arr=array[0..2000]of longint;
var
	i,j,n:Longint;
	ans,a,b:arr;
	la,lb,lc:longint;
	s:string;
	op:char;
	f:boolean;
operator +(a,b:arr)ans:arr;
var
	i:longint;
begin
	if la>lb then lc:=la else lc:=lb;
	fillchar(ans,sizeof(ans),0);
	for i:=1 to lc do
		ans[i]:=a[i]+b[i];
	for i:=1 to lc do
		begin
			ans[i+1]:=ans[i+1]+ans[i] div 10;
			ans[i]:=ans[i] mod 10;
		end;
	if ans[lc+1]>0 then inc(lc);
end;
procedure deal(s:string);
var
	i,p:longint;
	sa,sb:string;
begin
	p:=pos(' ',s);inc(p);op:=s[p];
	sa:=copy(s,1,p-2);sb:=copy(s,p+2,length(s)-p-1);
	//writeln(sa,op,sb);
	la:=length(sa);lb:=length(sb);
	for i:=length(sa) downto 1 do
		a[length(sa)-i+1]:=ord(sa[i])-48;
	for i:=length(sb) downto 1 do
		b[length(sb)-i+1]:=ord(sb[i])-48;
end;
operator -(a,b:arr)ans:arr;
var
	i:longint;
begin
	lc:=la;if lc<lb then lc:=lb;
	fillchar(ans,sizeof(ans),0);
	for i:=1 to lc do
		begin
			if a[i]>=b[i] then
				ans[i]:=a[i]-b[i]
			else
				begin
					inc(a[i],10);
					dec(a[i+1]);
					ans[i]:=a[i]-b[i];
				end;
		end;
	inc(lc,3);
	while (lc>1)and(ans[lc]=0 )do dec(lc);
end;
function sm(a,b:arr):boolean;
var
	i:longint;
begin
	if la<lb then exit(true);
	if la>lb then exit(false);
	{for i:=1 to la do
		write(a[i]);
	writeln;
	for i:=1 to lb do
		write(b[i]);
	writeln;}
	for i:=la downto 1 do
		if a[i]<b[i] then
			exit(true)
		else
			if a[i]>b[i] then exit(false);
	exit(false);
end;
operator *(a,b:arr)ans:arr;
var
	i,j:longint;
begin
	lc:=la+lb;
	fillchar(ans,sizeof(ans),0);
	for i:=1 to la do
		for j:=1 to lb do
			inc(ans[i+j-1],a[i]*b[j]);
	for i:=1 to lc do
		begin
			ans[i+1]:=ans[i+1]+ans[i] div 10;
			ans[i]:=ans[i]mod 10;
		end;
	if ans[lc+1]>0 then inc(lc);
	if ans[lc]=0 then dec(lc);
end;
procedure print;
var
	i:longint;
begin
	if f then write('-');
	for i:=lc downto 1 do
		write(ans[i]);
	writeln;
end;
begin
	assign(input,'calc.in');reset(input);assign(output,'calc.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		begin
			fillchar(a,sizeof(a),0);la:=0;fillchar(b,sizeof(b),0);lb:=0;lc:=0;
			readln(s);f:=false;
			deal(s);
			case op of
				'+':ans:=a+b;
				'-':if sm(a,b) then begin ans:=b-a;f:=true;end else ans:=a-b;
				'*':ans:=a*b;
				end;
			print;
		end;
	close(Output);
end.

