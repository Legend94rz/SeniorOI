var
	i,n:longint;
	ans:array[1..50000]of longint;
	s:array[1..50000]of string;
function check(m,l:longint):boolean;
var
	i:longint;
        t:string;
begin
        t:=copy( s[m],1,l );
        for i:=1 to n do
		if(m<>i) then
			if( copy(s[i],1,l)=t )then
				exit(false);
	exit(true);
end;
procedure dfs(k,j:longint);
var
	r:longint;
	t:string;
begin
        if (k>n) then exit;
        if not ( check( k , j ) ) then
	begin
		s[k]:=copy(s[k],1,j+1);
		dfs(k+1,length(s[k+1]) );
		exit;
	end;
	dfs(k,j-1);
end;
begin
	readln(n);
	for i:=1 to n do
		readln(s[i]);
        if n=1 then begin writeln(s[1,1]);halt;end;
        dfs(1,length(s[1]));
	for i:=1 to n do
		writeln(s[i]);
end.
