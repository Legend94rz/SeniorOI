//http://www.cnblogs.com/sdjl/articles/1273759.html
//http://www.hnyzsz.net/Article/ShowArticle.asp?ArticleID=740
var
	k,i,j,l,n,m:longint;
	f,r:array[0..1001,0..1001]of longint;
	a:array[0..1001]of longint;
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
procedure pre(a,b:longint);
begin
	if b<a then exit;
	if a=b then begin write(a,' ');exit;end;
    write(r[a,b],' ');
    pre(a,r[a,b]-1);
	pre(r[a,b]+1,b);
end;
begin
	readln(n);
	for i:=1 to n do read(a[i]);
	{for i:=1 to n do
		for j:=0 to i-1 do
			f[i,j]:=1;}
	for i:=1 to n do begin f[i,i]:=a[i];r[i,i]:=i;end;
	for k:=1 to n do
		for i:=1 to n-k+1 do
			begin
				j:=i+k-1;
				for l:=i to j do
					begin
                        if (l>i)and(l<j) then{如果左,右子树存在}
							if f[i,j]<f[i,l-1]*f[l+1,j]+a[l] then
								begin
	                       			f[i,j]:=f[i,l-1]*f[l+1,j]+a[l];
									r[i,j]:=l;
                                end;
						if l=i then
							if f[i,j]<f[l+1,j]+a[l] then
								begin
									f[i,j]:=f[l+1,j]+a[l];
									r[i,j]:=l;
								end;
						if l=j then
							if f[i,j]<f[i,l-1]+a[l] then
								begin
									f[i,j]:=f[i,l-1]+a[l];
									r[i,j]:=l;
                                end;
                    end;
            end;
	writeln(f[1,n]);
	pre(1,n);
	writeln;
end.

