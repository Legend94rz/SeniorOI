const
	maxn=20003;
var
	i,j,n,m,loc:longint;
	Ht:array[0..30001]of string[21];
	count:array[0..30001]of longint;
	s:string;
function hash(s:string):longint;
var
	i,j:longint;
	cc:longint;
begin
	hash:=0;cc:=0;
	for i:=1 to length(s) do
		inc(hash,(i+3)*( ord(s[i])-ord('A') )*13 );
	hash:=hash mod maxn;
	if hash>n then hash:=1;
	while (ht[hash]<>'')and(ht[hash]<>s)and(hash<=maxn) do
		begin
			inc(hash);inc(cc);if cc>=maxn then exit(maxn);
			if hash>n then hash:=1;
		end;
	exit(hash);
end;
begin
	//assign(output,'test.txt');rewrite(output);
	readln(n);
	fillchar(ht,sizeof(ht),0);
	for i:=1 to n do
		begin
			readln(s);loc:=hash(s);ht[loc]:=s;
			inc(count[loc]);
		end;
	readln(m);
	for i:=1 to m do
		begin
			readln(s);
			writeln(count[hash(s)]);
		end;
	//close(output);
end.

