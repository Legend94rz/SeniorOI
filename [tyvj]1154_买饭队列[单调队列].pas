type
	node=record
		h,t:longint;
		end;
var
	i,j,n,m:longint;
	x,y:longint;
	l,r,time,ot:longint;
	q:array[0..1000001]of node;
begin
	readln(n);l:=0;r:=0;
	for i:=1 to n do
		begin
			read(x);
			if x=1 then writeln(m);				//人数
			if x=2 then begin inc(ot);if q[l+1].t=ot then inc(l);dec(m);end;	//出队
			if x=3 then								//进队
				begin
					readln(y);inc(m);inc(time);
					while (q[r].h<y)and(r>l) do dec(r);
					inc(r);q[r].h:=y;q[r].t:=time;
				end;
			if (x=4) then
				if l<r then
	                writeln(q[l+1].h)
                else
                  	writeln(0);		//最高的人
		end;
end.

