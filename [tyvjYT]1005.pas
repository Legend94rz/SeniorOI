var
	a:array[0..100]of string;
	b:array[0..21]of boolean;
	n,i,j:longint;
	cH:char;
	ans:string;
procedure dfs(i:longint;s:string);
var
	k:longint;
	st:string;
begin
	if i>n then exit;
	for k:=1 to n do
		if not b[k] then
			begin
			b[k]:=true;
			st:=s;
			s:=s+a[k];
			if (i=n)and(s>ans) then
				//begin
				ans:=s;
				//writeln(ans,'#');
				//end;
			dfs(i+1,s);
			b[k]:=false;
			s:=st;
			end;
end;
begin
	readln(n);i:=1;
	ans:='';
	while not eoln do
		begin
			read(ch);
			if ch in['0'..'9'] then
				a[i]:=a[i]+ch
			else
				inc(i);
		end;
        {for i:=1 to n do
                writeln(a[i]);}
	dfs(1,'');
	writeln(ans);
end.
