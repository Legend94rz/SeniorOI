type
	node=record
		x,y:longint;
	end;
var
	i,j,n,m:longint;
	a:array[0..1021,0..1021]of longint;
	l,r,mid:longint;
	p:boolean;
	dx:array[1..4]of longint=(-1,0,1,0);
	dy:array[1..4]of longint=(0,-1,0,1);
	q:array[0..1500001]of node;
	v:array[0..1021,0..1021]of boolean;
function check(Key:longint):boolean;
var
	i:longint;
	t:node;
	l,r:longint;
begin
	fillchar(v,sizeof(v),0);
	fillchar(q,sizeof(q),0);
	l:=0;r:=0;
	for i:=1 to m do if a[2,i]<=key then begin inc(r);q[r].x:=2;q[r].y:=i;v[2,i]:=true;end;
	repeat
		inc(l);
		for i:=1 to 4 do
			begin
				t.x:=q[l].x+dx[i];
				t.y:=q[l].y+dy[i];
				if (t.x>=2)and(t.x<=n-1)and(t.y>=1)and(t.y<=m)and(not v[t.x,t.y])and(a[t.x,t.y]<=key) then
					begin
						inc(r);q[r]:=t;
						v[t.x,t.y]:=true;
						if (t.x=n-1) then exit(true);
					end;
			end;
	until l>r;
	exit(false);
end;
begin
	assign(input,'murder.in');reset(input);assign(output,'murder.out');rewrite(output);
	readln(n,m);
	for i:=1 to n do
		for j:=1 to m do
			begin
				read(a[i,j]);
				if a[i,j]>r then r:=a[i,j];
			end;
	l:=0;r:=1001;
	repeat
		mid:=(l+r) shr 1;
		p:=check(mid);
		if p then
			r:=mid-1
		else
			l:=mid+1;
	until l>r;
	writeln(l);
	close(output);
end.

