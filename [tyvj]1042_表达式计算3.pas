uses math;
var
	tm,i,j,n,m,p,xf,a,b,ans:longint;
	s,t:string;
function cheng_or_chu:longint;
var
	i:longint;
begin
	for i:=1 to length(s) do
		if s[i]in['*','/'] then
			exit(i);
	exit(-1);
end;
begin
	readln(s);
	while pos('^',s)<>0 do
		begin
			p:=pos('^',s);i:=p-1;j:=P+1;
			while s[i]in ['0'..'9'] do dec(i);
			while s[j]in ['0'..'9'] do inc(j);
			val(copy(s,i+1,p-i-1),a);val(copy(s,p+1,j-p-1),b);
			//writeln('xf*',a,'*',b,'*');
            xf:=a**b;str(xf,t);delete(s,i+1,j-i-1);insert(t,s,i+1);
        end;//done
	//writeln(s);
//----------------------
	tm:=cheng_or_chu;
	while tm>0 do
		begin
			i:=tm-1;j:=tm+1;
			while s[i] in['0'..'9'] do dec(i);while s[j]in['0'..'9']do inc(j);
			val(copy(s,i+1,tm-i-1),a);val(copy(s,tm+1,j-tm-1),b);
			//writeln('c',a,'*',b,'*');
			if s[tm]='*' then
                xf:=a*b
			else
				xf:=a div b;
            str(xf,t);delete(s,i+1,j-i-1);insert(t,s,i+1);
			tm:=cheng_or_chu;
        end;//done
	//writeln(s);
//-----------------------
	if pos('+',s)+pos('-',s)>0 then
    begin
		for i:=1 to length(s) do if (s[i]='+')or(s[i]='-')then break;
		tm:=i;val(copy(s,1,tm-1),ans);
		for i:=tm+1 to length(s) do
       	 	if s[i]in['+','-'] then
				begin
					val(copy(s,tm+1,i-tm-1),a);
					if s[tm]='+' then
						ans:=ans+a
					else
						ans:=ans-a;
					tm:=i;
        		end;
		val(copy(s,tm+1,i-tm),a);
		if s[tm]='+' then
			ans:=ans+a
		else
			ans:=ans-a;
   	 	writeln(ans);
		exit;
	end;
    writeln(s);
end.

