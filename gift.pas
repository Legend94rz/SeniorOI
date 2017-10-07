type
	node=record
		name:string;
		be:longint;
	end;
var
	f:array[-5..5005]of node;
	i,j,n,k:longint;
	ans:int64;
procedure qsort(s,t:longint);
var
	i,j:longint;
	k:string;
	y:node;
begin
	i:=s;j:=t;k:=f[(s+t) shr 1].name;
	repeat
		while f[j].name>k do dec(j);
		while f[i].name<k do inc(i);
		if i<=j then
			begin
				y:=f[i];f[i]:=f[j];f[j]:=y;
				inc(i);dec(j);
			end;
	until i>=j;
	if (i<t) then qsort(i,t);
	if (s<j) then qsort(s,j);
end;
function s2I(s:string):longint;
begin
	val(s,s2i);
end;
procedure cal(x:longint);
var
	i,j:longint;
	p:longint;
	fd:boolean;
begin
	fd:=false;
	for i:=x+1 to x+3 do
		if (copy(f[i].name,1,pos(' ',f[i].name)-1)=copy(f[x].name,1,pos(' ',f[x].name)-1))and(f[i].be=2)then
			begin
				inc(ans,s2i( copy(f[i].name,pos(' ',f[i].name)+1,length(f[i].name)-pos(' ',f[i].name)) )*s2i(copy(f[x].name,pos(' ',f[x].name)+1,length(f[x].name)-pos(' ',f[x].name))));
				fd:=true;
			end;
	for i:=x-1 downto x-3 do
		if (copy(f[i].name,1,pos(' ',f[i].name)-1)=copy(f[x].name,1,pos(' ',f[x].name)-1))and(f[i].be=2)then
			begin
				inc(ans,s2i( copy(f[i].name,pos(' ',f[i].name)+1,length(f[i].name)-pos(' ',f[i].name)) )*s2i(copy(f[x].name,pos(' ',f[x].name)+1,length(f[x].name)-pos(' ',f[x].name))));
				fd:=true;
			end;
	if not fd then
		begin
			writeln('Unknow');
			close(output);
			halt;
		end;

end;
begin
	assign(input,'gift.in');reset(input);assign(output,'gift.out');rewrite(output);
	readln(n,k);
	if n>k then
		begin
			writeln('Unknow');
			close(output);
			halt;
		end;
	for i:=1 to n do
		begin
			readln(f[i].name);
			f[i].be:=1;
		end;
	for i:=1 to k do
		begin
			readln(f[n+i].name);
			f[n+i].be:=2;
		end;
	qsort(1,n+k);
	{for i:=1 to n+k do
		writeln(f[i].name,' ',f[i].be);}
	for i:=1 to n+k do
		if f[i].be=1 then
			cal(i);
	writeln(ans);
	close(input);close(output);
end.
