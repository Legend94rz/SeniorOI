type
	union=set of '0'..'9';
var
	i,j,n,m,ans:longint;
	a,f:array[0..100]of longint;
	b:array[0..100]of boolean;
	u:union;
function check:boolean;
var
	i,j,a,b,t:longint;
	j1,j2,s:string;
	te:longint;
begin
	a:=0;b:=0;
	for i:=1 to 3 do a:=a*10+f[i];
	for i:=4 to 5 do b:=b*10+f[i];
	str(a*f[5],j1);str(a*(b-f[5]),j2);str(a*f[5]+a*(b-f[5]),s);
	if (lengtH(j1)<>3)or(length(j2)<>4)or(length(s)<>4) then exit(false);
	for I:=1 to length(j1) do
		if not (j1[i] in u) then
			exit(false);
	for i:=1 to lengtH(j2)-1 do
		if not (j2[i] in u) then
			exit(false);
	for i:=1 to length(s) do
		if not (s[i] in u) then
			exit(false);
	exit(true);
end;
procedure dfs(i:longint);
var
	k,j:longint;
begin
	if i>5 then exit;
	for k:=1 to n do
		begin
			f[i]:=a[k];
			if i=5 then
				if check then
					inc(ans);
			dfs(i+1);
		end;
end;
begin
	readln(n);u:=[];
	for i:=1 to n do
		begin
			read(a[i]);
			u:=u+[chr(a[i]+48)];
		end;
	dfs(1);
	writeln(ans);
 end.
