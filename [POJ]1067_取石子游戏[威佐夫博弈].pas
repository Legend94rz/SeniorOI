const
	c=(1+sqrt(5))/2;
var
	k,n,m,t:longint;
begin
	while not eof do
		begin
			readln(n,m);
			if n>m then
				begin
					t:=n;n:=m;m:=t;
  		      	end;
			k:=m-n;
			//writeln(n,' ',m,' ',k,' ',trunc(k*c));
			if n=trunc(k*c) then
				writeln(0)
			else
				writeln(1);
		end;
end.

