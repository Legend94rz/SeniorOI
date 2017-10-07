{
ID:rz109291
LANG:PASCAL
PROG:milk
}
var
	i,j,n,w,curw,cost:longint;
	p,a:array[0..6000]of longint;
procedure qsort(s,t:longint);
var
	i,j,k,y:longint;
begin
	i:=s;j:=t;k:=p[s];
	repeat
		while p[j]>k do dec(j);
		while p[i]<k do inc(i);
		if i<=j then begin
			y:=p[i];p[i]:=p[j];p[j]:=y;
			y:=a[i];a[i]:=a[j];a[j]:=y;
			dec(j);inc(i);
			end;	
	until i>=j;
	if (s<j)then qsort(s,j);
	if (i<t)then qsort(i,t);
end;
begin
	assign(input,'milk.in');reset(input);assign(output,'milk.out');rewrite(output);
	readlN(w,n);
	for i:=1 to n do
		readln(p[i],a[i]);
	qsort(1,n);
	i:=0;
	while true do
		begin
			curw:=curw+a[i];
			cost:=cost+a[i]*p[i];
			if curw+a[i+1]>w then break;
			inc(i);
		end;
	inc(i);
	inc(cost,p[i]*(w-curw));
	writeln(cost);
	close(input);close(output);
end.
