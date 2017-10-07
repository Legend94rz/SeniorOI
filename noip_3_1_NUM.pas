var
	tar,i,j1,j2,low,high:longint;
function test(key:longint):boolean;
var
	t,i,k,j:Longint;
	a:array[0..3] of byte;
	f:boolean;
begin
	t:=key;k:=0;
	for i:=j1 to j2 do
		begin
			key:=t;
			j:=0;
			f:=true;
			while key>0 do
				begin
					inc(j);
					a[j mod 4]:=key mod i;
					if j>2 then
						if a[j mod 4]<>a[(j-2) mod 4] then begin f:=false;break;end;
					if j>1 then
						if a[j mod 4]=a[(j-1) mod 4] then begin f:=false; break; end;
					key:=key div i;
				end;
			if f then inc(k);
			if k>tar then exit(false);
		end;
	exit(k=tar);
end;
begin
	readln(j1,j2,low,high,tar);
	for i:=low to high do
		if test(i) then
			writeln(i);
end.