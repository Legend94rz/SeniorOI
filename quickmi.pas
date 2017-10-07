var
   y,a,b,s:int64;
begin
     readlN(a,b);
     s:=1;
     while b>0 do
         begin
         if (b and 1)=1 then s:=s*a;
         a:=a*a;
         b:=b shr 1;
         end;
     writelN(s);
end.
