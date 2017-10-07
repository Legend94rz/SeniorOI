var
	i,j,n,m,tot,x,y,z:Longint;
	e,head,ed,next:array[0..200001]of longint;
	a,col:array[0..200001]of longint;
	l,r,mid:longint;
	v:array[0..100001]of boolean;
	q:array[0..400001]of longint;

procedure qsort(s,t:longint);
var
	i,j,u,k:longint;
begin
	i:=s;j:=t;k:=a[(s+t)shr 1];
	repeat
		while a[j]<k do dec(j);
		while a[i]>k do inc(i);
		if i<=j then
			begin
				u:=a[i];a[i]:=a[j];a[j]:=u;
				inc(i);dec(J);
            end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
function check(key:longint):boolean;
var
	b,ege,i:longint;
	l,r,k:longint;
	std,count:longint;
begin
	STD:=a[key];fillchar(v,sizeof(v),0);//writeln(std);
	for i:=1 to n do
		if not v[i] then
			begin
				l:=0;r:=1;q[r]:=i;col[i]:=0;
				repeat
					inc(l);if l>=200000 then l:=1;
					k:=q[l];
					ege:=head[k];
					while ege<>0 do
						begin
							if e[ege]<=std then begin ege:=next[ege];continue;end;
							b:=ed[ege];
							if not v[b] then
								begin
									col[b]:=1-col[k];
									inc(r);if r>=200000 then r:=1;
									q[r]:=b;v[b]:=true;
								end
							else
								if col[b]<>1-col[k] then
									exit(false);
							ege:=next[ege];
						end;
				until l=r;
			end;
	exit(true);
end;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
begin
	readln(n,m);
	for i:=1 to m do
		begin
			readln(x,y,z);
			ADD(x,y,z);add(y,x,z);
			a[i]:=z;
        end;
	qsort(1,m);
	l:=1;r:=m+1;
	repeat
		mid:=(l+r+1)shr 1;
		if check(mid) then
			l:=mid
		else
			r:=mid-1;
	until l=r;
	writeln(a[l]);
end.


