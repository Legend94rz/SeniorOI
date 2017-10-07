{
ID:rz109291
PROG:transform
LANG:PASCAL
}
var
	i,j,n,x,y,k:longint;
	st:string;
	ex:boolean;
	ch,target,temp:array[0..11,0..11]of char;
procedure change;
var
	t:array[0..11,0..11]of char;
begin
	t:=temp;x:=1;y:=1;
	for j:=1 to n do
		for i:=n downto 1 do
			begin
			temp[x,y]:=t[i,j];
			inc(y);
			if y>n then begin y:=1;inc(x);end;
			end;
end;
function ok :boolean;
var
	i,j:longint;
begin
	for i:=1 to n do
		for j:=1 to n do
			if temp[i,j]<>target[i,j] then exit(false);
	exit(true);
end;
begin
	assign(input,'transform.in');assign(output,'transform.out');reset(input);rewrite(output);
	readln(n);
	for i:=1 to n do
		begin
			readln(st);
			for j:=1 to n do
				ch[i,j]:=st[j];
		end;
	for i:=1 to n do
		begin
			readln(st);
			for j:=1 to n do
				target[i,j]:=st[j];
		end;
	temp:=ch;
	change;
	if ok then begin writeln(1);halt;end;
        temp:=ch;
	for k:=1 to 2 do
		change;
	if ok then begin writelN(2);halt;end;
        temp:=ch;
	for k:=1 to 3 do
		change;
	if ok then begin writeln(3);halt;end;
	x:=1;y:=1;
	for i:=1 to n do
		for j:=n downto 1 do
			begin
				temp[x,y]:=ch[i,j];
				inc(y);
				if y>n then begin y:=1;inc(x);end;
			end;
	if ok then begin writeln(4);halt;end;
	change;
	if ok then begin writeln(5);halt;end;
	change;change;
	if ok then begin writeln(5);halt;end;
	change;change;change;
	if ok then begin writeln(5);halt;end;
	ex:=true;
	for i:=1 to n do
		for j:=1 to n do
			if ch[i,j]<>target[i,j] then begin ex:=false;break;end;
	if ex then begin writeln(6);halt;end;
	writeln(7);	
	close(input);close(output);
end.
