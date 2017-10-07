var
 a,b,m:integer;
 c:char;
begin
 writeln('InputStartNum:');
 readln(a);
 writeln('InputEndNum:');
 readln(b);
 repeat
   if (a+b)mod 2<>0 then
        m:=(a+b)div 2+1
   else
        m:=(a+b)div 2;
   writeln(m);
   write('IsBigger?');
   readln(c);
   if(c='y')or(c='Y') then
        b:=m
   else
        if(c='N')or(c='n')then
                a:=m;
 until (c='e')or(c='E');
end.
