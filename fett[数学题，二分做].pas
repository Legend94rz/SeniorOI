var
	i,j,n:longint;
	e,d:array[-1..1000001]of int64;
	l,r,mid,t:int64;
function check(K:int64):longint;
var
	i:longint;
	p:int64;
begin
	for i:=3 to n-1 do e[i]:=2*e[i-1]-2*d[i-1]-e[i-2];
	p:=int64(2*e[n-1])-int64(2*d[n-1])-e[n-2];
	if p=e[n] then
		exit(0)
	else
		if p<e[n] then exit(1) else exit(2);
end;
begin
	assign(input,'fett.in');reset(input);assign(output,'fett.out');rewrite(output);
	readln(n,e[1],e[n]);
	for i:=2 to n-1 do read(d[i]);
	l:=-10000000000000;r:=-l;
	repeat
		//writeln(l,' ',r,' ',mid);
		mid:=(l+r)div 2;
		e[2]:=mid;t:=check(mid);
		if t=0 then
			begin
				for i:=1 to n do write(e[i],' ');writeln;
				close(output);exit;
			end;
		if t=1 then l:=mid+1 else r:=mid-1;
	until l>r;
	close(output);
end.
