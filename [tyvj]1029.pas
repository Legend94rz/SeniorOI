var
	a,b,z,y:string;
	ans:array[0..200] of longint;
	i,j:longint;
begin
	readlN(a);
	readln(b);
	if length (a)>length(b) then
		begin
			z:=a;a:=b;b:=z;
		end;
	for i:=1 to length(a)-1 do
		begin
			z:=copy(a,1,i);
			y:=copy(a,i+1,length(a)-i);
			//write(z,' ',y);
			if pos(z,b)=length(b)-i+1 then
				begin
				inc(j);
				ans[j]:=i;
				//writeln(ans[j]);
				end;
			if pos(y,b)=1 then
				begin
				inc(j);
				ans[j]:=length(y );
				//writeln(ans[j]);
				end;
			//writeln;
		end;
	for i:=1 to j do
		if ans[i]>ans[0] then
			ans[0]:=ans[i];
	writeln(ans[0]);
end.
