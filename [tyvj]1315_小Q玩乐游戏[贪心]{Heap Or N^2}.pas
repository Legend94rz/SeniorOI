type
	node=record
		a,no:longint;
		end;
var
	i,j,n,m,ans,p:longint;
	a,u:array[0..10001]of longint;
	hp:array[0..100001]of node;
	la:longint;
	t:node;
procedure swap(x,y:Longint);
var
	t:node;
begin
	t:=hp[x];hp[x]:=hp[y];hp[y]:=t;
end;
procedure up;
var
	x:longint;
begin
	x:=la;
	while (x>1)and(hp[x shr 1].a>hp[x].a) do begin swap(x,x shr 1);x:=x shr 1;end;
end;
procedure down;
var
	t,j:Longint;
begin
	j:=2;
	while j<=la do
		begin
			if (hp[j].a>hp[j+1].a)and(j+1<=la) then inc(j);
			if (hp[j].a<hp[j shr 1].a) then
				begin
					swap(j,j shr 1);
					j:=j shl 1;
				end
			else
				break;
        end;
end;
begin
	readln(n,m);
	for i:=1 to n do
		begin
			readln(a[i],u[i]);
			inc(la);
			hp[la].a:=a[i];hp[la].no:=i;
            up;
        end;
	for i:=1 to m do
		begin
			inc(ans,hp[1].a);t:=hp[1];
			hp[1]:=hp[la];dec(la);
			down;inc(la);
			hp[la].a:=t.a+u[t.no];hp[la].no:=t.no;
			up;
        end;
	{for i:=1 to m do
		begin
			p:=1;
			for j:=2 to n do
				if a[j]<a[p] then
					p:=j;
			ans:=ans+a[p];
			a[p]:=a[p]+u[p];
        end;}
	writeln(ans);
end.

