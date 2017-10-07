program ty1014;
{uses
	math;}
var
	l,i,j,k,n:longint;
	f:array[0..101,0..101]of longint;
	a:array[0..101]of longint;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
begin
	readln(n);
	for i:=1 to n do
		read(a[i]);
	fillchar(f,sizeof(f),$7f);
	for i:=1 to n-1 do f[i,i+1]:=0;
	for l:=1 to n do
		for i:=1 to n-l+1 do
			begin
				j:=i+l-1;
				if j<=i+1 then begin f[i,j]:=0;continue;end;
				for k:=i+1 to j-1 do
					f[i,j]:=min(f[i,j],f[i,k]+f[k,j]+a[i]*a[k]*a[j]);
			End;
	writeln(f[1,n]);
end.
