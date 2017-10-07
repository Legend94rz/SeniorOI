var
	a:array[0..100001]of longint;
	W:ARRAY[0..200001]of longint;
	b:array[0..200001]of boolean;
	ch:char;
	i,n,k,no:longint;
	L:longint;
procedure swap(x,y:longint);
var
	u:longint;
begin
	u:=a[x];a[x]:=a[y];a[y]:=u;
end;
procedure up(x:longint);
begin
	while (x shr 1>=1)and(w[a[x]]>w[a[x shr 1]]) do swap(x,x shr 1);
end;
procedure down(x:longint);
var
	j:longint;
begin
	while (x shl 1<=L) do
		begin
			j:=x shl 1;if (w[a[j]]<w[a[j+1]])and(j<L) then inc(j);
			if w[a[x]]<w[a[j]] then swap(j,x) else break;
			x:=j;
		end;
end;
procedure insert1(no,key:longint);
begin
	//WRITELN('INSERT No.:',NO,' DATA= ',KEY);
	inc(L);a[l]:=no;w[no]:=key;
	up(L);
end;
procedure delete1(no:Longint);
begin
	//WRITELN('Now No.:',NO,' -> FALSE');
	b[no]:=true;
end;
procedure get(var NO,K:longint);
begin
	while b[A[1]] do
		begin
			a[1]:=a[L];down(1);dec(L);
        end;
	no:=a[1];k:=w[a[1]];
end;
begin
	readln(n);
	for i:=1 to n do
		begin
		    read(ch);
			case ch of
				'I':begin readln(k);insert1(i,k);end;
				'D':begin readln(K);delete1(K);end;
				'Q':begin readln;	get(no,k);writeln(k,' ',NO);end;
			end;
		end;
end.

