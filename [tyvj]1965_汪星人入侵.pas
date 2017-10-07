var
  n,i,k:longint;
begin
   readln(n);
   for i:=1 to n do
    begin
     readln(k);
     writeln(trunc(sqrt(k)));
    end;
end.
