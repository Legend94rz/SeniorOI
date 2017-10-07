program hdu1561;
var
	i,j,n,m,a,b:longint;
	w,next,head,ed:array[0..40005]of longint;
	f:array[0..205,0..205]of longint;
procedure add(x,tot,val:longint);
begin
	ed[tot]:=tot;
	w[tot]:=val;
	next[tot]:=head[x];
	head[x]:=tot;
end;
{function max(a,b:longint):longint;
begin
	if (a>b) then exit(a);
	exit(b);
End;}
procedure bag(s,c:longint);
var
	i,k,ege:longint;
begin
	ege:=head[s];
	while ege<>0 do
		begin
			k:=ed[ege];
			for i:=1 to c do
				f[k,i]:=f[s,i];
			bag(k,c-1);
			for i:=1 to c do
				if f[k,i-1]+w[k]>f[s,i] then
					f[s,i]:=f[k,i-1]+w[k];
			ege:=next[ege];
		end;
end;
begin
	while true do
		begin
			readLN(n,m);
			fillchar(f,sizeof(f),0);
			fillchar(w,sizeof(w),0);fillchar(ed,sizeof(ed),0);
			fillchar(next,sizeof(next),0);
			fillchar(head,sizeof(head),0);
			if (n=m)and(n=0) then break;
			for i:=1 to n do
				begin
					read(a,b);
					add(a,i,b);
				end;
			bag(0,m);
			writeln(f[0,m]);
		End;
end.
