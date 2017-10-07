{
求满足x*y+x+y=h的非负整数解的个数
}
type
	node=record
		h,no:longint;
		end;
var
	i,j,n,m:Longint;
	qes:array[0..100001]of node;
	ans:array[0..100001]of longint;
procedure calc(x:Longint);
var
	t,i,p,high:longint;
begin
	t:=0;p:=trunc(sqrt(qes[x].h));
	if p*p+p+p=qes[x].h then high:=p else high:=p-1;
	for i:=0 to high do
		if ((qes[x].h-i)mod(i+1) )=0 then
			inc(t);
	ans[qes[x].no]:=t*2;
	if p*p+p+p=qes[x].h then dec(ans[qes[x].no]);
end;
procedure qsort(s,t:longint);
var
	i,j,k:longint;
	u:node;
begin
	i:=s;j:=t;k:=qes[(s+t)shr 1].h;
	repeat
		while qes[j].h>k do dec(j);
		while qes[i].h<k do inc(i);
		if i<=j then
			begin
				u:=qes[i];qes[i]:=qes[j];qes[j]:=u;
				inc(i);dec(j);
            end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
begin
	assign(input,'hash.in');reset(input);assign(output,'hash.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		begin
			readln(qes[i].h);
			qes[i].no:=i;
		end;
	qsort(1,n);//qes[0].h:=-1;
	for i:=1 to n do
		begin
			if qes[i].h=1 then begin ans[qes[i].no]:=2;continue;end;
			if (qes[i].h<>qes[i-1].h) then calc(i) else ans[qes[i].no]:=ans[qes[i-1].no];
        end;
	for i:=1 to n do writeln(ans[i]);
	close(output);
end.

