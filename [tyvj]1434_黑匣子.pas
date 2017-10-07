type
	arr=record
		d:array[-1..800001]of longint;
		n:longint;
		end;
var
	i,j,k,n,m,u:longint;
	geti,t:longint;
	a,b:arr;
	count,x,y:array[-1..800001]of longint;
procedure downa(i:longint);
var
	k,j:longint;
begin
	k:=a.d[i];
	j:=i shl 1;
	while j<=a.n do
		begin
			if (J<a.n){这句貌似跟堆排不同，注意！} and(a.d[j]>a.d[j+1]) then inc(J);
			if a.d[j]<k then
				begin
					a.d[i]:=a.d[j];
					i:=j;
					j:=i shl 1;
				end
			else
				break;
        end;
	a.d[i]:=k;
end;
procedure downb(i:longint);
var
	k,j:longint;
begin
	k:=b.d[i];
	j:=i shl 1;//指向i的左儿子
	while j<=b.n do
		begin
			if (j<b.n)and(b.d[j]<b.d[j+1]) then inc(j);//指向较大的儿子
			if k<b.d[j] then
				begin
					b.d[i]:=b.d[j];
					i:=j;
					j:=i shl 1;
                end
			else
				break;
        end;
	b.d[i]:=k;
end;
procedure upa(i:longint);
var
	k,j:longint;
begin
	k:=a.d[i];
	j:=i shr 1;
	while i>1 do
		begin
			if a.d[j]>k then
				begin
					a.d[i]:=a.d[j];
					i:=j;
					j:=i shr 1;
                end
			else
				break;
        end;
	a.d[i]:=k;
end;
procedure upb(i:longint);
var
	k,j:longint;
begin
	k:=b.d[i];
	j:=i shr 1;
	while i>1 do
		begin
			if k>b.d[j] then
				begin
					b.d[i]:=b.d[j];
					i:=j;
					j:=i shr 1;
				end
			else
				break;
        end;
	b.d[i]:=k;
end;
procedure check;
var
	u:longint;
begin
  if b.n>=geti then
  	begin
  		u:=b.d[1];b.d[1]:=b.d[b.n];b.d[b.n]:=u;
  		dec(b.n);
  		downb(1);
//---------------------------
  		inc(a.n);
  		a.d[a.n]:=u;
  		upa(a.n);
      end;
end;
function get:longint;
var
	u,j:longint;
begin
	get:=a.d[1];
    u:=a.d[1];a.d[1]:=a.d[a.n];a.d[a.n]:=u;
	dec(a.n);
	downa(1);
//------------------------
	inc(b.n);
	b.d[b.n]:=u;
	upb(b.n);
    inc(geti);
	check;
end;
begin
	readln(n,m);
	for i:=1 to n do read(x[i]);
	for i:=1 to m do begin read(t);inc(count[t]);end;
	geti:=1;
	for i:=1 to n do
		begin
			inc(b.n);
			b.d[b.n]:=x[i];
			upb(b.n);
			check;
			while count[i]>0 do//有get操作
				begin
					dec(count[i]);
					writeln(get);
                end;
        end;
end.

