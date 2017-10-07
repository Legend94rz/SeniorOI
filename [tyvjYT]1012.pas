type
	node=record
		l,r:longint;
		end;
var
	i,j,xi,p,l1,r1,l2,r2,sum:longint;
	x,f:char;
	s,t:string;
	qz,qy:array[0..300]of node;
        res:extended;
function s2i(key:string):longint;
begin
	val(key,s2i);
	exit(s2i);
end;
begin
	readln(s);
	p:=pos('=',s);
	for i:=1 to length(s) do
		if s[i] in['a'..'z'] then
			begin
				x:=s[i];
				break;
			end;
	r1:=1;qz[1].l:=1;
	for i:=1 to p-1 do
		if (s[i] in['+','-'])and(i-1>0) then
			begin
				qz[r1].r:=i-1;
				inc(r1);
				qz[r1].l:=i;
			end;
	qz[r1].r:=p-1;
	r2:=1;qy[1].l:=p+1;
	for i:=p+1 to length(s) do
		if (s[i]in['+','-'])and(i-1>p) then
			begin
				qy[r2].r:=i-1;
				inc(r2);
				qy[r2].l:=i;
			end;
	qy[r2].r:=length(s);
	for i:=1 to r1 do
		begin
			t:=copy(s,qz[i].l,qz[i].r-qz[i].l+1);
			if pos(x,t)<>0 then
				inc(xi,s2i(copy(t,1,length(t)-1)))
			else
				dec(sum,s2i(t));
		end;
	for i:=1 to r2 do
		begin
			t:=copy(s,qy[i].l,qy[i].r-qy[i].l+1);
			if pos(x,t)<>0 then
				dec(xi,s2i(copy(t,1,length(t)-1)))
			else
				inc(sum,s2i(t));
		end;
	//writeln(sum,' ',xi);
	res:=sum/xi;
	if res=0 then res:=0;
	writeln(x,'=',res:0:3);
end.
