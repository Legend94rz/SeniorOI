var
	i,j,n,l,k:longint;
	s,t:string;
	f:array[0..300,0..300]of longint;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
function macH(a,b:char):boolean;
begin
	exit((a='(')and(b=')')or(a='[')and(b=']'));
end;
begin
	assign(input,'brack.in');reset(input);assign(output,'brack.out');rewrite(output);
	readln(s);n:=length(s);fillchar(f,sizeof(f),$3f);
	for i:=1 to n do
		begin
			f[i,i]:=1;f[i,i-1]:=0;
		end;
	for l:=2 to n do
		for i:=1 to n-l+1 do
			begin
				j:=i+l-1;
				if mach(s[i],s[j]) then
					f[i,j]:=min(f[i,j],f[i+1,j-1])
				else
					f[i,j]:=min(f[i,j],min(f[i,j+1]+1,f[i+1,j]+1));
				for k:=i to j do
					f[i,j]:=min(f[i,j],f[i,k]+f[k+1,j]);
			end;
	writeln(f[1,n]);
	close(output);
end.

