type
	node=record
		s:string;
		val:longint;
		end;
const
	d:array['a'..'z']of longint=(4,2,5,6,1,4,5,6,7,2,3,4,8,9,3,1,2,6,8,9,2,6,3,2,5,7);
var
	a:array[0..50005]of node;
	i,j,n,m:longint;
operator <(a,b:node) ans:boolean;
begin
	if a.val>b.val then exit(true);
	if (a.val=b.val)and(length(a.s)>length(b.s)) then exit(true);
	if (a.val=b.val)and(length(a.s)=length(b.s))and(a.s>b.s) then exit(true);
	exit(false);
end;
operator >(a,b:node) ans:boolean;
begin
	if (a.val<b.val) then exit(true);
	if (a.val=b.val)and(length(a.s)<length(b.s)) then exit(true);
	if (a.val=b.val)and(length(a.s)=length(b.s))and(a.s<b.s) then exit(true);
	exit(false);
end;
procedure qsort(s,t:longint);
var
	i,j:longint;
	y,k:node;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1];
	repeat
		while a[j]>k do dec(j);
		while a[i]<k do inc(i);
		if i<=j then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				inc(i);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
function cal(k:string):longint;
var
	i:longint;
begin
	cal:=0;
	for i:=1 to length(k) do
		inc(cal,d[k[i]]);
end;
begin
	assign(input,'crack.in');reset(input);assign(output,'crack.out');rewrite(output);
	readln(n,m);
	for i:=1 to n do
		begin
			readln(a[i].s);
			a[i].val:=cal(a[i].s);
		end;
	qsort(1,n);
	for i:=1 to m do
		writeln(a[i].s,' ',a[i].val);
	close(output);
end.
