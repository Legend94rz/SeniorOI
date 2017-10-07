{
ID:rz109291
PROG:barn1
LANG:PASCAL
}
var
	a,d:array[0..300]of longint;
	i,j,n,m,s,c,max,p,l:longint;
	b:array[0..400]of boolean;
procedure qsort(s,t:longint);
var
	i,j,k,y:longint;
begin
	i:=s;J:=t;k:=a[s];
	repeat
		while a[j]>k do dec(j);
		while a[i]<k do inc(i);
		if i<=j then begin
		y:=a[i];a[i]:=a[j];a[j]:=y;inc(i);dec(j);		
		end;
	until i>=j;
	if (i<t)then qsort(i,t);
	if (s<j)then qsort(s,j);
end;
begin
	assign(input,'barn1.in');assign(output,'barn1.out');reset(input);rewrite(output);
	readlN(m,s,c);
	readln(a[1]);
	for i:=2 to c do
		readln(a[i]);
	qsort(1,c);
	for i:=2 to c do
		d[i]:=a[i]-a[i-1];
	if m=1 then begin writeln(a[c]-a[1]+1);close(output);halt;end;
	if m>=c then begin writeln(c);close(output);halt;end;
	repeat
		max:=0;
		for i:=2 to c do
			if (d[i]>max)and(not b[i]) then begin max:=d[i];p:=i;end;
		inc(l,max);
		b[p]:=true;
		inc(n);
	until n>=m-1;
	writeln(a[c]-a[1]-l+m);
	close(output);close(input);
end.
