var
	n,m,i,x,y,k,r,p:integer;
	len:longint;
	s:array[1..1500]of string;
	di:array[1..4]of integer=(1,0,-1,0);
	dj:array[1..4]of integer=(0,1,0,-1);
	b:array[1..1500,1..1500]of boolean;
	t:char;
begin
	readln(n,m);
	//len:=1;
	fillchar(b,sizeof(b),true);
	for I:=n downto 1 do
		readln(s[i]);
	readln(r,p);
	repeat
		t:=s[r,p];
		k:=ord(t)-48;
		if (b[r+di[k],p+dj[k]])and(r+di[k]<=n)and(p+dj[k]<=m) then
		begin
			b[r+di[k],p+dj[k]]:=false;
			r:=r+di[k];p:=p+dj[k];
			len:=len+1;
		end
		else
		if(b[r,p]=false) then
			begin
				writeln(len);
				halt;
			end
			else
				writeln(r+di[k],p+dj[k]);
	until false;
end.