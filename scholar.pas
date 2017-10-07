type
	data=record
		name:string;
		FinE,cla,ArtNum:integer;
		IsWest,IsBan:string;
		Earn:longint;
	end;
var
	all:longint;
	c,j:byte;
	l:array[1..100] of data;
	n,i,max,code:integer;
    t:string;
begin
	assign(input,'scholar.in');reset(input);assign(output,'scholar.out');rewrite(output);
	readln(n);
    j:=1;
	for i:=1 to n do
	    begin
			readln(t);
			while(t[j] in ['a'..'z'])or(t[j]in ['A'..'Z'])do j:=j+1;
			l[i].name:=copy(t,1,j-1);
			j:=j+1;
			if (t[j+2] in ['0'..'9']) then begin val(copy(t,j,3),l[i].FinE,code);j:=j+4;end else begin val(copy(t,j,2),l[i].FinE,code);j:=j+3;end;
			if (t[j+2] in ['0'..'9']) then begin val(copy(t,j,3),l[i].cla,code);j:=j+4;end else begin val(copy(t,j,2),l[i].cla,code);j:=j+3;end;
			l[i].IsBan:=t[j];
			j:=j+2;
			l[i].IsWest:=t[j];
			j:=j+2;
			if(t[j+1] in ['0'..'9']) then val(copy(t,j,2),l[i].ArtNum,code) else val(copy(t,j,1),l[i].ArtNum,code);
			j:=1;
            end;
	for i:=1 to n do
	begin
		if(l[i].FinE>80)and(l[i].ArtNum>=1)then  l[i].Earn:=l[i].Earn+8000;
		if(l[i].FinE>85)and(l[i].cla>80) then    l[i].Earn:=l[i].Earn+4000;
		if(l[i].FinE>90)                   then  l[i].Earn:=l[i].Earn+2000;
		if(l[i].FinE>85)and(l[i].IsWest='Y')then l[i].Earn:=l[i].Earn+1000;
		if(l[i].cla>80)and(l[i].IsBan='Y')then   l[i].Earn:=l[i].Earn+850;
	end;
	{for i:=1 to n do
		writeln(l[i].name,' ',l[i].FinE,' ',l[i].cla,' ',l[i].Isban,' ',l[i].iswest,' ',l[i].earn);}
    for i:=1 to n do
		begin
			if l[i].Earn>max then begin max:=l[i].Earn; c:=i;end;
			all:=l[i].Earn+all;
		end;
	writeln(l[c].name);
	writeln(l[c].Earn);
	writeln(all);
	close(output);
end.
