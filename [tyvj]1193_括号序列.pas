uses math;
var
	k,l,i,j,n:longint;
	f:array[0..300,0..300]of longint;
	s:string;
function can(x,y:char):boolean;
begin
	if (x='(')and(y=')') then exit(true);
	if (x='[')and(y=']') then exit(true);
	exit(false);
end;
begin
	readln(s);
	fillchar(f,sizeof(f),$3f);n:=length(s);
	for i:=1 to n do begin f[i,i]:=1;f[i+1,i]:=0;end;
	for l:=2 to n do
		for i:=1 to n-l+1 do
			begin
				j:=i+l-1;
				//f[i,j]:=min(f[i,j-1]+1,f[I+1,j]+1);
				//if can(s[j-1],s[j]) then f[i,j]:=min(f[i,j],f[i,j-2]);
				//if can(s[i],s[i+1]) then f[i,j]:=min(f[i,j],f[i+2,j]);
				//if can(s[i],s[j]) then f[i,j]:=min(f[i,j],f[i+1,j-1]);
				if can(s[i],s[j]) then
					f[i,j]:=min(f[i,j],f[i+1,j-1])
				else
					f[i,j]:=min(f[i,j-1]+1,f[i+1,j]+1);
				for k:=i to j-1 do
					f[i,j]:=min(f[i,j],f[i,k]+f[k+1,j]);
            end;
	writeln(f[1,n]);
end.

