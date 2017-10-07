var
	i,j,n,m,ans:longint;
	a:array['A'..'z']of int64;
	b:array[0..10001]of int64;
	T:int64;
	c:char;
	s:string;
procedure qsort(s,t:longint);
var
	i,j,k,u:Longint;
begin
	i:=s;j:=t;k:=b[(s+t) shr 1];
	repeat
		while b[j]>k do dec(j);
		while b[i]<k do inc(I);
		if i<=j then
			begin
				u:=b[i];b[i]:=b[j];b[j]:=u;
				inc(i);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
begin
	readln(t,n);
	for c:='a' to 'z' do begin read(a[c]);a[UPcase(c)]:=a[c];end;
	readln;
	for I:=1 to n do
		begin
			readln(s);
			for j:=1 to length(s) do
				begin
					b[i]:=b[i]+a[s[j]];
                end;
		end;
	qsort(1,n);
	for i:=1 to n do
		if t>=b[i] then
			begin
				inc(ans);
				t:=t-b[i];
			end;
	if ans=n then begin writeln('Yes');writeln(t);end
	else
		begin
			writeln('No');
			writeln(ans);
		end;
end.

