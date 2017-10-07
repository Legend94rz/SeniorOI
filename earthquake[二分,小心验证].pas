var
	i,j,n,m,l,r,mid,sum,t:longint;
	a:array[0..1000001]of longint;
	ch:char;
function check(key:longint):longint;
var
	i,j:longint;
	count:longint;
begin
	count:=0;i:=1;
	while true do
		begin
			while (a[i]=0)and(i<n+1) do inc(i);
			if i>n then break;
			j:=i;
			while (j-i+1<key)and(j<n+1) do inc(j);
			i:=j+1;
			inc(count);
			if j>n then break;
		end;
	exit(count);
end;
begin
	assign(input,'earthquake.in');reset(input);assign(output,'earthquake.out');rewrite(output);
	readln(n,m);
	for i:=1 to n do
		begin
			read(ch);
			a[i]:=ord(ch)-48; inc(sum,a[i]);
        end;
    if sum=0 then begin writeln('0');close(output);halt; end ;
	l:=1;r:=n;
	repeat
		mid:=(l+r) shr 1;
		t:=check(mid);
		//writeln('>',mid,' ',t);
		if t>m then
			l:=mid+1
		else
			r:=mid-1;
	until l>r;
	writeln(l);
	close(output);
end.

