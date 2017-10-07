const
	 vch:set of char=['A','E','I','O','U'];
var
   i,j:longint;
   s:string;
   last:char;
   b:array[0..300] of boolean;
   ch:array[0..300]of char;
function check(c:char;p:longint):boolean;
var
   i:longint;
begin
      if not (c in['A'..'Z']) then exit(false);
      for i:=1 to p-1 do
     	 if (s[i]=c) then
            exit(true);
     exit(false);
end;
Begin
	 readlN(s);
     for i:=1 to length(s) do
	 	 if (s[i]in vch )or(check(s[i],i) )then
         	b[i]:=true;
     last:='^';
     for i:=1 to length(s) do
     	 if (not b[i])and(s[i]<>last) then
            begin
                 inc(j);
                 ch[j]:=s[i];
            	 last:=s[i];
            end;
     fillchar(b,sizeof(b),0);
     for i:=1 to j do
              if (ch[i]=' ')and((i=1)or(i=j)or(ch[i+1]in[',','.','?']))then b[i]:=true;
     for i:=1 to j do
     	 	  if not b[i] then
                 write(ch[i]);
     writeln;
End.

