var
   i,j,n,m,max:longint;
   a:array[0..1000]of longint;
   f:array[0..645000]of boolean;
function gcd(a,b:longint):longint;
var
   t:longint;
begin
  if (b=0)then exit(a);
  if a=0 then exit(b);
  if (a=1)or (b=1)then exit(1);
  if b>a then begin
  	 t:=b;b:=a;a:=t;
  end;
  exit(gcd(b,a mod b));
end;
begin
     assign(input,'bag1.in');reset(input);assign(output,'bag1.out');rewrite(output);
     readln(n);
     for i:=1 to n do
     	 begin
       	 readln(a[i]);
         if a[i]=1 then
       	 	begin
         		 writeln(0);
				 close(output);
                 halt;
			end;
         end;
     f[0]:=true;
     for i:=1 to n do
         for j:=a[i] to 256*256-256*2 do
             if f[j-a[i]] then
                f[j]:=true;
	 for i:=256*256-256*2 downto 0 do
	 	 if not f[i] then
		 	begin
            writeln(i);
			break;
            end;
     //writeln(max);
     close(output);
end.
