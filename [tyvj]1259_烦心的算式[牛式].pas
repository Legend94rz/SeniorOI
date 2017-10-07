var
	i,j,n,x,z,y,c,d,ans:longint;
	b:set of byte;
function check(a,c,d:longint):boolean;
var
	i,t:longint;
	s:string;
	function ok(k:longint):boolean;
	    begin
        	while k>0 do
        		begin
        			if not (k mod 10 in b) then exit(false);
        			k:=k div 10;
                end;
			exit(true);
        end;
begin
	if (not (c in b))or(not (d in b))or(not ok(a)) then exit(false);
	if (not ok(a*c))or(a*c<100)or(a*c>=1000) then exit(false);
	if (not ok(a*d))or(a*d<100)or(a*d>=1000) then exit(false);
	if (not ok(a*d+a*c*10))or(a*d+a*c*10<1000)or(a*d+a*c*10>9999) then exit(false);
	//writeln(a,' ',c,' ',d);
	exit(true);
end;
begin
	readln(n);
	for i:=1 to n do
		begin
			read(x);b:=b+[x];
        end;
	//writeln(9 in b);
	for x:=1 to 9 do
		for y:=1 to 9 do
			for z:=1 to 9 do
				for c:=1 to 9 do
					for d:=1 to 9 do
						if check(x*100+y*10+z,c,d) then
							inc(ans);
	writeln(ans);
end.

