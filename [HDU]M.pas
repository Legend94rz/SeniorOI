var
	i,j,n,l:longint;
	ch:array[0..100]of char;
	t:char;
	r:longint;
	flag:boolean;
	used:array[0..100]of boolean;
	ans:array[0..30]of char;
	vowel:set of char=[];
	s:string;
procedure print;
var
	i:longint;
begin
	for i:=1 to l do
		write(ans[i]);
	writeln;
end;
procedure dfs(i,x,y,last:longint);
var
	k,j,e,f:longint;
begin
	if i>l then exit;
	for k:=last to r do
		if not used[k] then
			begin
				if (not (ch[k]in vowel)) and (x=0)and(i=l) then continue;
				if (ch[k]in vowel)and((y=0)and(i=l-1)or(y=1)and(l=i))then continue;
				used[k]:=true;
				ans[i]:=ch[k];
				if i=l then print;
				if ch[k]in vowel then begin e:=1;f:=0;end else begin e:=0;f:=1;end;
				dfs(i+1,x+e,y+f,k);
				used[k]:=false;
			end;
end;
begin
	readlN(l,n);
	readln(s);
	vowel:=['a','e','i','o','u'];
	for i:=1 to length(s) do
		if s[i]<>' ' then
			begin
				inc(r);
				ch[r]:=s[i];
			end;
	repeat
		flag:=true;
		for i:=1 to r-1 do
			if ch[i]>ch[i+1] then
				begin
					t:=ch[i];ch[i]:=ch[i+1];ch[i+1]:=t;
					flag:=false;
				end;
	until flag;
	dfs(1,0,0,1);
end.

