const
	maxs=6000;
type
	node=record
	     dep:longint;
	     str:string;
	     end;
	que=record
	    data:array[1..maxs]of node;
	    l,r:longint;
	    end;
var
	q:array[0..1]of que;
	s:0..1;
	n,i,maxk:longint;
	x,newx,temp:string;
	a:array[0..6,0..1]of string;
function check(x:string;s:byte):boolean;
var
	i,j:longint;
begin
	for i:=1 to q[1-s].r do
		if (q[1-s].data[i].str = x)then
			begin
				writeln(q[s].data[q[s].l].dep+1+q[1-s].data[i].dep);
				halt;
			end;
	for i:=1 to q[s].r do
		if (q[s].data[i].str=x)then
			exit(true);
	exit(false);
end;
procedure init;
begin
	while (not eof)and(i<=6) do
	begin
		readln(temp);
		a[i,0]:=copy(temp,1,pos(' ',temp)-1);
		a[i,1]:=copy(temp,pos(' ',temp)+1,length(temp));
		inc(i);
	end;
	maxk:=i-1;
	if a[0,0]=a[1,0]then begin
		writeln(0);
		halt;
		end;
	for i:=0 to 1 do
		begin
			q[i].l:=0;q[i].r:=1;
			q[i].data[1].str:=a[0,i];
			q[i].data[1].dep:=0;
		end;
end;
procedure expand(s:byte);
var
	temp,x:string;
	ld,lx,j,i:longint;
begin
	inc(q[s].l);
	x:=q[s].data[q[s].l].str;
	ld:=length(x);
	for i:=1 to maxk do
		begin
			lx:=length(a[i,s]);
			for j:=1 to ld-lx+1 do
				if (copy(x,j,lx)=a[i,s]) then
					begin
						newx:=copy(x,1,j-1)+a[i,1-s]+copy(x,j+lx,ld);
						if  not check(newx,s) then
							begin
								inc(q[s].r);
								q[s].data[q[s].r].str:=newx;
								q[s].data[q[s].r].dep:=q[s].data[q[s].l].dep+1;
							end;
					end;
		end;
end;
procedure cal;
begin
	while true do
		begin
			if (q[0].l=q[0].r)or (q[0].r=maxs)then
				if (q[1].l=q[1].r)or(q[0].r=maxs) then
					break
				else
					expand(1)
			else
				if (q[1].l=q[1].r)or(q[1].data[q[1].r].dep=maxs)then
					expand(0)
				else
					if q[0].r<=q[1].r then
						expand(0)
					else
						expand(1);
			if (q[0].data[q[0].r].dep+q[1].data[q[1].r].dep>=11)then
				break;
		end;
	writeln('NO')
end;
begin
	assign(input,'chuan.in');reset(input);assign(output,'chuan.out');rewrite(output);
	init;
	cal;
	close(input);close(output);
end.
