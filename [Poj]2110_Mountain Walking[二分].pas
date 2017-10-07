type
	node=record
		x,y:longint;
	end;
var
	i,j,n,m:longint;
	a:array[0..201,0..201]of longint;
	l,r,mid:longint;
	dx:array[1..4]of longint=(-1,0,1,0);
	dy:array[1..4]of longint=(0,1,0,-1);
function check(key:longint):boolean;
var
	i,l,r,j:longint;
	tx,ty:longint;
	q:array[0..100001]of node;
	v:array[0..201,0..201]of boolean;
begin
	for i:=0 to m-key do
		if (a[1,1]>=i)and(a[1,1]<=i+key) then
		begin
        	fillchar(v,sizeof(v),0);v[1,1]:=true;
        	r:=1;q[r].x:=1;q[r].y:=1;l:=0;
			repeat
				inc(l);if l>=100000 then l:=1;
				for j:=1 to 4 do
					begin
						tx:=q[l].x+dx[j];
						ty:=q[l].y+dy[j];
						if (tx>=1)and(tx<=n)and(ty<=n)and(ty>=1)and(not v[tx,ty]) then
							if (a[tx,ty]>=i)and(a[tx,ty]<=i+key) then
								begin
									inc(r);if r>=100000 then r:=1;
									q[r].x:=tx;q[r].y:=ty;
									v[tx,ty]:=true;
									if (tx=n)and(ty=n) then exit(true);
								end;
					end;
			until l=r;
        end;
	exit(false);
end;
begin
	readln(n);
	for i:=1 to n do
		for J:=1 to n do
			begin
				read(a[i,j]);
				if a[i,j]>m then m:=a[i,j];
			end;
	l:=0;r:=m;
	repeat
		mid:=(l+r)shr 1;
		if check(mid) then
			r:=mid-1
		else
			l:=mid+1;
	until l>r;
	writeln(l);
end.

