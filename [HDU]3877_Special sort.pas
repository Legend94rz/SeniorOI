type
	nde=record
		x,y:int64;
		ct,t:longint;
		end;
var
	u,t,i,j,n,m:Longint;
	a:array[0..10001]of nde;
	cc:array[1..3]of char=('<','=','>');
function sm(a,b:nde):boolean;
begin
	if (a.x+a.y)>(b.x+b.y) then begin sm:=false;exit;end;
	if (a.x+a.y)<(b.x+b.y) then begin sm:=true;exit;end;
	if (a.ct)>(b.ct) then begin sm:=false;exit;end;
	if (a.ct)<(b.ct) then begin sm:=true;exit;end;
	sm:=b.t<a.t;
end;
function bg(a,b:nde):boolean;
begin
	if (a.x+a.y)<(b.x+b.y) then begin bg:=false;exit;end;
	if (a.x+a.y)>(b.x+b.y) then begin bg:=true;exit;end;
	if (a.ct<b.ct) then begin bg:=false;exit;end;
	if (a.ct>b.ct) then begin bg:=true;exit;end;
	bg:=b.t>a.t;
end;
procedure qsort(s,t:longint);
var
	i,j:longint;
	k,u:nde;
begin
	k:=a[(s+t)shr 1];i:=s;j:=t;
	repeat
		while bg(k,a[j]) do dec(j);
		while sm(k,a[i]) do inc(i);
		if i<=j then
			begin
				u:=a[i];a[i]:=a[j];a[j]:=u;
				inc(i);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
begin
	readln(t);
	for u:=1 to t do
		begin
			readln(n);
			fillchar(a,sizeof(a),0);
			for i:=1 to n do
				begin
					readln(a[i].x,a[i].y);a[i].t:=i;
					if a[i].x<a[i].y then a[i].ct:=1;
					if a[i].x=a[i].y then a[i].ct:=2;
					if a[i].x>a[i].y then a[i].ct:=3;
				end;
			qsort(1,n);
			for i:=1 to n do writeln(a[i].x,'+',a[i].y,'=[',cc[a[i].ct],a[i].x+a[i].y,']');
			WRITELN;
		end;
end.

