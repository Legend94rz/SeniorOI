var
	i,j,n:Longint;
	Li,ti,count:longint;
	ans,c,m,x:int64;
function min(a,b:int64):int64;
begin
	if a<b then exit(a);
	exit(b);
end;
begin
	readln(n,m);
	for i:=1 to n do
		begin
			readln(ti,Li,x,c);
			if li>=ti then begin
				if m mod (li-ti)<>0 then count:=m div (li-ti)+1 else count:=m div (li-ti);
				ans:=ans+min(int64(count*c),int64(c+int64(m*x)));
			end
			else
				ans:=ans+int64(m*x)+c;
            //writeln('>>',ans);
        end;
	writeln(ans);
end.

