type
	node=record
		x,y:longint;
		end;
	arr=array[0..101,0..101]of longint;
var
	x,y,tm,i,j,n,m,t,k,ss,xx,zz,yy:longint;
	ch:array[-300..300,-300..300]of char;
	a,tt:arr;
	f,hf:boolean;
	q:array[0..201,0..201]of node;
	r:array[0..201]of longint;
	inq:array[0..301,0..301]of boolean;
procedure draw(a:arr);
begin
	y:=-1;
	for j:=1 to m do
		begin
			y:=y+2;if y>yy then yy:=y;
			t:=a[n,j];
			for i:=1 to n do
				begin
					x:=110;
					for k:=1 to a[i,j] do
						begin
							ch[x,y]:=' ';
							if x=110 then ch[x,y]:='_';//最底层
							ch[x,y-1]:='|';//左界
							ch[x,y+1]:='|';//右界
							if not inq[x,y+1] then begin inc(r[j]);q[j,r[j]].x:=x;q[j,r[j]].y:=y+1;inq[x,y+1]:=true;{writeln('add ',j,' ',r[j]);}end;
							dec(x);if x<ss then ss:=x;
							ch[x,y]:=' ';
						end;
					ch[x,y]:='_';
				end;
		end;
	inc(y);
	for j:=1 to m do
		for i:=1 to r[j] do
			if (ch[q[j,i].x,q[j,i].y-1]<>ch[q[j,i].x,q[j,i].y+1]) then begin break;end else ch[q[j,i].x,q[j,i].y]:=ch[q[j,i].x,q[j,i].y-1];
end;
begin
	//assign(input,'sst.in');reset(input);assign(output,'sst.out');rewrite(output);
	readln(n,m);ss:=maxlongint;xx:=110;zz:=0;yy:=0;
	for i:=1 to n do
		for j:=1 to m do read(a[i,j]);
	readln(t);fillchar(ch,sizeof(ch),'*');
	case t of
		1:draw(a);
		2:begin
			x:=1;y:=1;
			for j:=m downto 1 do
				for i:=1 to n do
					begin
						tt[x,y]:=a[i,j];
						inc(y);if y>n then begin y:=1;inc(x);end;
					end;
			tm:=n;n:=m;m:=tm;
			draw(tt);
		end;
		3:begin
			write(' ');for i:=1 to 2*m-1 do write('_');writeln;
			for i:=1 to n do
				begin
					write('|');
					for j:=1 to 2*m-1 do if i=n then write('_') else write(' ');
					writeln('|');
				end;
			end;{3}
	end;
	for i:=ss to 110 do
		begin
			for J:=0 to yy+1 do
				if ch[i,j]<>'*' then
					write(ch[i,j])
				else
					if (ch[i,j-1]=ch[i,j+1])and(ch[i,j+1]='_') then
						write('_')
					else
						write(' ');
			writeln;
		end;
	close(output);
end.

