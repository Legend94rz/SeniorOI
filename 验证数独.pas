var
	n:1..20;
    b:array[1..20,1..9,1..9,1..9]of boolean;
    i,j,h,l,m,s:byte;
    a:array[1..20,1..9,1..9]of 1..9;
    rlt:array[1..20]of string;
	t:array[1..9]of boolean;
begin
    readln(n);
    for m:=1 to n do
        for i:=1 to 9 do
			for j:=1 to 9 do
				begin
					readln(a[m,i,j]);
					if (not b[m,i,j,a[m,i,j]]) then
						b[m,i,j,a[m,i,j]] :=true
					else
						rlt[m]:='Wrong';
					end;
	for m:=1 to n do
		for j:=1 to 9 do
			for i:=1 to 9 do
				if(rlt[m]<>'Wrong')then
					begin
						if(not b[m,i,j,a[m,i,j]] )then
							b[m,i,j,a[m,i,j]]:=true
						else 
							rlt[m]='Wrong';
					end
				else
					break;
	h:=1;l:=1;
	for m:=1 to n do
		for s:=1 to 9 do
			for i:=j to j+3 do
				for j:=l to l+3 do
					if rlt[m]<>'Wrong' then
						if not t[a[m,i,j]]then
							t[a[m,i,j]]:=false
						else
							rlt[m]:='Wrong';
end.