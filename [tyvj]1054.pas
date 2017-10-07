program ty1054;
const
	mm=10000000;
type
	arr=record
		d:array[0..1000]of longint;
		len:longint;
		end;
var
	t:qword;
	a:array[0..100]of longint;
	l,i,n,m,j,u:longint;
	tot:arr;
	s,ans:string;
	f:array[0..100,0..100]of arr;
procedure print(k:arr);
var
	i:longint;
begin
	if k.len=0 then write(0);
	for i:=k.len downto 1 do
		write(k.d[i]);
end;
operator * (a:longint;b:arr)ans:arr;
var
	i:longint;
begin
	//print(b);write(' * ',a,' = ');
	for i:=1 to b.len do
		b.d[i]:=b.d[i]*a;
	for i:=1 to b.len do
		begin
			b.d[i+1]:=b.d[I+1]+b.d[i] div mm;
			b.d[i]:=b.d[i] mod mm;
		end;
	while b.d[b.len]>0 do
		begin
			b.d[b.len+1]:=b.d[b.len] div mm;
			b.d[b.len]:=b.d[b.len] mod mm;
			inc(b.len);
		end;
	//if (b.d[b.len]=0) and(b.len>1) then dec(b.len);
	//print(b);writeln;
	exit(b);
end;
operator + (a:arr;b:longint)ans:arr;
var
	i:longint;
begin
	a.d[1]:=a.d[1]+b;
	//print(a);write(' + ',b,' = ');
	i:=1;
	while a.d[i]>0 do
		begin
			a.d[i+1]:=a.d[i+1]+a.d[i] div mm;
			a.d[i]:=a.d[i] mod mm;
			inc(i);
		end;
	if i>a.len then a.len:=i;
	//print(a);writeln;
	exit(a);
end;
operator + (a:arr;b:arr)ans:arr;
var
	i,m:longint;
begin
	fillchar(ans,sizeof(ans),0);
	//print(a);write(' ++ ');print(b);write(' = ');
	m:=a.len;if m<b.len then m:=b.len;
	for i:=1 to m do
		begin
			ans.d[i]:=ans.d[i]+a.d[i]+b.d[i];
			//if ans.d[i]>=mm then begin
				ans.d[i+1]:=ans.d[i+1]+ans.d[i] div mm;
				ans.d[i]:=ans.d[i] mod mm;
			//end;
		end;
	ans.len:=m;
	if ans.d[ans.len+1]>0 then inc(ans.len);
	//print(ans);writeln;
end;
function max(a,b:arr):arr;
var
	i:longint;
begin
	if a.len>b.len then exit(a);
	if a.len<b.len then exit(b);
	for i:=a.len downto 1 do
		begin
		if a.d[i]<b.d[i] then
			exit(b);
		if a.d[i]>b.d[i] then
			exit(a);
		end;
	exit(a);
end;
begin
	readln(n,m);
	for u:=1 to n do
		begin
			fillchar(f,sizeof(f),0);
			for j:=1 to m do
				read(a[j]);
			for j:=1 to m do
				begin
					f[j,j].d[1]:=a[j]*2;
					f[j,j].len:=1;
				end;
			for l:=2 to m do
				for i:=1 to m-l+1 do
					begin
						j:=i+l-1;
						f[i,j]:=2*max(f[i+1,j]+a[i],f[i,j-1]+a[j]);
					end;
			tot:=tot+f[1,m];
		end;
	for i:=tot.len downto 1 do
		begin
			str(tot.d[i],s);
			if (s='0')and(i=tot.len)and(i>1) then continue;
			while (length(s)<7)and(i<>tot.len) do insert('0',s,1);
			ans:=ans+s;
		end;
	while (ans[1]='0')and(length(ans)>1) do delete(ans,1,1);
	writeln(ans);
end.
