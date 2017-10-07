type
	arr=array[0..100001]of longint;
var
	i,j,n,m:longint;
	ans:int64;
	our,em:arr;
	b:array[0..100001]of boolean;
procedure qsort(var a:arr;s,t:longint);
var
	i,j,k,y:longint;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1];
	repeat
		while a[j]>k do dec(j);
		while a[i]<k do inc(i);
		if (i<=j) then begin
		y:=a[i];a[i]:=a[j];a[j]:=y;
		inc(i);dec(j);
		end;
	until i>=j;
	if (s<j) then qsort(a,s,j);
	if (i<t) then qsort(a,i,t);
end;
begin
	//assign(input,'input10.txt');reset(input);
	readln(m,n);
	if m>=n then begin writeln(0);halt;end;
	for i:=1 to m do
		readln(em[i]);
	for i:=1 to n do
		readln(our[i]);
	qsort(em,1,m);
	qsort(our,1,n);
	j:=1;
	for i:=1 to m do
		begin
		while (our[j]<=em[i])and(j<n)or(b[j]) do
			inc(j);
		b[j]:=true;
		end;
	for i:=1 to n do
		if not b[i] then
			inc(ans,our[i]);
	writeln(ans);
end.
