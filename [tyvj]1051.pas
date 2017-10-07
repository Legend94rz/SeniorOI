type
	tree=record
		l,r,num:longint;
		end;
var
	tr:array[0..1000]of tree;
	b:array[0..1000,0..1000] of longint;
	i,j,k,n,m:longint;
	x,t:longint;
function find(x,y:longint):longint;
var
	temp1,temp2,i,j:longint;
begin
	if b[x,y]>=0 then exit(b[x,y]);
	if (x=0)or(y=0) then
		begin
			b[x,y]:=0;
			exit(0);
		end;
	temp1:=find(tr[x].r,y);
	for i:=0 to y-1 do
		begin
			temp2:=find(tr[x].l,i)+find(tr[x].r,y-i-1)+tr[x].num;
			if temp2>temp1 then
				temp1:=temp2;	
		end;
	b[x,y]:=temp1;
	exit(b[x,y]);
end;
begin
	readln(n,m);
	fillchar(b,sizeof(b),$ff);
	for i:=1 to n do
		begin
			readln(x,tr[i].num);
			if tr[x].l=0 then
				tr[x].l:=i
			else
				begin
					t:=tr[x].l;
					while tr[t].r<>0 do
						t:=tr[t].r;
					tr[t].r:=i;
				end;
		end;
	writeln(find(tr[0].l,m));
end.
