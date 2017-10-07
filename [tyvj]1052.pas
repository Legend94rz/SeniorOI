program ty1052;
uses
	math;
var
	root,tot,i,n,x,y:longint;
	ind,next,ed,w,head:array[0..12000]of longint;
	le:array[0..6001]of boolean;
	f:array[0..7000,0..2]of longint;
procedure add(x,y:longint);
begin
	inc(tot);le[x]:=false;inc(ind[y]);
	ed[tot]:=y;
	next[tot]:=head[x];
	head[x]:=tot;
end;
function dp(s,c:longint):longint;
var
	ege,b:longint;
begin
	if f[s,c]>0 then exit(f[s,c]);
	if (c=0) then
		if le[s] then
			begin
				f[s,c]:=0;
				exit(f[s,c]);
			End
		else
			begin
				ege:=head[s];
				while ege<>0 do
					begin
						b:=ed[ege];
						inc(f[s,c],max(dp(b,1),dp(b,0)));
						ege:=next[ege];
					end;
			end;
	if (c=1) then
		if le[s] then
			begin
				f[s,c]:=w[s];//writeln(s,' will be leave');
				exit(f[s,c]);
			end
		else
			begin
				ege:=head[s];//if s=root then writeln('5s ege:',ege);
				while ege<>0 do
					begin
						b:=ed[ege];
						inc(f[s,c],dp(b,0));
						ege:=next[ege];
					end;
				inc(f[s,c],w[s]);
			end;
	exit(f[s,c]);
end;
begin
	readln(n);
	for i:=1 to n do
		readln(w[i]);
	fillchar(f,sizeof(f),0);
	fillchar(le,sizeof(le),1);
	for i:=1 to n-1 do
		begin
			readln(x,y);
			add(y,x);
		End;
	readln;
	for i:=1 to n do
		if ind[i]=0 then
			begin
				root:=i;
				break;
			End;
	//writeln('root=',root);
	writeln(max(dp(root,1),dp(root,0)));
	{for i:=1 to n do
		writeln('f[',i,',0]=',f[i,0],'; f[',i,',','1]=',f[i,1]);}
end.
