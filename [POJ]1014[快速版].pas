var   f:array[0..200000] of boolean;
      count:array[0..200000] of longint;
      tot,sum,i,j:longint;
      a:array[0..10] of longint;
 
 
begin
      while not eof do
      begin
            inc(tot); sum:=0;
            for i:=1 to 6 do
            begin
                  read(a[i]);
                  inc(sum,a[i]*i);
            end;
            readln;
            if sum=0 then halt;
            writeln('Collection #',tot,':');
            if sum and 1=1 then
            begin
                  writeln('Can''t be divided.');
                  writeln;
                  continue;
            end;
            sum:=sum>>1;
            fillchar(f,sizeof(f),false);
            f[0]:=true;
            for i:=1 to 6 do
            begin
                  fillchar(count,sizeof(count),0);
                  for j:=i to sum do
                  if (not f[j])and(f[j-i])and(count[j-i]<a[i]) then
                  begin
                        f[j]:=true;
                        count[j]:=count[j-i]+1;
                  end;
                  if f[sum] then
                  begin
                        writeln('Can be divided.');
                        writeln;
                        break;
                  end;
            end;
            if not f[sum] then
            begin
                  writeln('Can''t be divided.');
                  writeln;
            end;
      end;
end.
