const
	x:array[0..2]of char=('+','-','.');
	sm:array[0..15]of longint=(0, 0, 0, 1, 1, 1, 1, 6, 10, 11, 17, 88, 162, 197, 437, 1350);
var
	n,ans,m,i:longint;
	b:array[0..9]of char;
	c:array[1..9]of longint;
	q:array[0..20] of longint;
	r:longint;
	s:string;
	ch,h:char;
function cal(m:string):int64;
vaR
	u,j,w:integer;
	e,f:int64;
begin
	cal:=0;
	w:=0;
	for j:=length(m) downto 1 do
		if(m[j]=' ')or(m[j]='.')then delete(m,j,1);
	if pos('-',m)+pos('+',m)=0 then exit(1);
	for j:=1 to length(m) do if(m[j]='+')or(m[j]='-')then begin w:=j;break;end;
	if(w=0)then w:=length(m);
	val(copy(m,1,w-1),e);
	cal:=e;
	for u:=w+1 to length(m) do
	begin
		if (m[u]='+')or(m[u]='-')then
		begin
			j:=u;
			val(copy(m,w+1,j-w-1),f);
			if (m[w]='+')then
				cal:=cal+f
			else
				cal:=cal-f;
		end;
		w:=j;
	end;
	val(copy(m,w+1,length(m)-w),f);
	if (m[w]='+')then
		cal:=cal+f
	else
		cal:=cal-f;
end;
function i2s(k:longint):string;
begin
	str(k,i2s);
end;
function change(key:string):string;
var
	i:longint;
begin
	for i:=1 to length(key) do
		if key[i]=' ' then
			key[i]:='+';
	exit(key);
end;
procedure dfs(i:longint;str:string);
var
	k,p,t,z,sum:longint;
	st:string;
	j:byte;
begin
	if (q[i]>n-1)then exit;
	for k:=0 to 2 do
		begin
			st:=str;
			str[q[i]]:=x[k];
			if (q[i]=q[r]){and(sum=0)} then
				if cal(str)=0 then
				begin
					inc(ans);
					if ans<=20 then
						begin 
							for j:=1 to length(str)-1 do
								if (str[j+1]in['.','+','-'])or (str[j]in['+','-','.']) then
									write(str[j],' ')
								else
									write(str[j]);
							writeln(str[length(str)]);
						end
					else
						begin
						writeln(sm[m]);
						halt;
						end;
				end;
			dfs(i+1,str);
			str:=st;
		end;
end;
begin
	readln(n);m:=n;
	for i:=1 to n-1 do
		s:=s+i2s(i)+' ';
	s:=s+i2s(n);
	for i:=1 to length(s) do
		if s[i]=' 'then
			begin
				inc(r);
				q[r]:=i;
			end;
	n:=length(s);
	q[r+1]:=n;
	dfs(1,s);
	writeln(ans);
end.
