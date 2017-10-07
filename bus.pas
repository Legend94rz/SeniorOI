program bus;
type
	node=record
		pre,dep,da,we:longint;
	End;
var
	next,head,ed,enum:array[0..100000]of longint;
	i,j,n,m,key:longint;
	x:array[0..1000,1..2]of longint;
	q:array[0..2000,1..4]of longint;
	l,r:longint;
	c:array[0..1005]of boolean;
procedure print;
var
	ans:array[0..1000]of longint;
	rr,i:longint;
begin
	rr:=0;
	writeln(q[r,2]);
	while q[r,3]<>0 do
		begin
		inc(rr);
		ans[rr]:=q[r,4];
		r:=q[r,3];
		end;
	for i:=rr downto 1 do
		writeln(ans[i]);
	close(output);
	halt;
end;
begin
	assign(input,'bus.in');reset(input);assign(output,'bus.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		readlN(x[i,1],x[i,2]);
	readln(key,q[1,1],q[2,1]);
	fillchar(c,sizeof(c),1);
	l:=0;r:=2;
	repeat
		inc(l);
		for i:=1 to n do
				if (x[i,1]=q[l,1])and(c[i]) then
					begin
						inc(r);
						q[r,1]:=x[i,2];
						c[i]:=false;
						q[r,2]:=q[l,2]+1;
						q[r,3]:=l;
						q[r,4]:=i;
						if q[r,1]=key then
							print;
					end;
	until l>=r;
	writeln('impossible');
	close(output);
end.
