program poj3345;
//http://www.cppblog.com/Yuan/archive/2010/04/28/113833.html?opt=admin
var
	i,j,n,v,tot:longint;
	w,next,head,ed,ind:array[0..400]of longint;
	f:array[0..400,0..400]of longint;
	s:string;
	qu:array[0..400]of string;
	r:longint;
	//vi:array[0..400]of boolean;
procedure add(a,b:longint);
begin
	inc(tot);
	ed[tot]:=b;inc(ind[b]);
	next[tot]:=head[a];
	head[a]:=tot;
End;
function hash(k:string):longint;
var
	i:Longint;
begin
	for i:=1 to r do
		if qu[i]=k then
			exit(i);
	inc(r);qu[r]:=k;
	exit(r);
End;
procedure deal(key:string;no:longint);
var
	i,j:longint;
	ft:string;
	value,p,x,y:longint;
begin
	p:=pos(' ',key);key:=key+' ';
	ft:=copy(key,1,p-1);delete(key,1,p);
	x:=hash(ft);
	p:=pos(' ',key);ft:=copy(key,1,p-1);
	val(ft,value);delete(key,1,p);
	p:=pos(' ',key);w[x]:=value;
	while p<>0 do
		begin
			ft:=copy(key,1,p-1);
			y:=hash(ft);
			add(x,y);
			delete(key,1,p);
			p:=pos(' ',key);
		end;
End;
function dfs(u:longint):longint;
var
	num,j,k,i,ege,son:longint;
begin
    //vi[u]:=true;
    num:=1;ege:=head[u];
	while ege<>0 do
		begin
			son := ed[ege];
			inc(num,dfs(son));
			ege:=next[ege];
		end;
    f[u,0]:=0;
	ege:=head[u];
	while ege<>0 do
		begin
			son := ed[ege];
			for j:=n downto 1 do
				for k:=0 to j do
					if(f[u,j]>f[u,j-k]+f[son,k]) then
						f[u,j]:=f[u,j-k]+f[son,k];
			ege:=next[ege];
		end;
    //不要放在上面，因为num包括了所有儿子节点，然后还更新的话，就是重复了！
    if(f[u,num]>w[u]) then f[u,num]:=w[u];
	exit(num);
end;
begin
	//assign(output,'test.txt');rewrite(output);
	while  true do
	begin
		readln(s);while s[1]=' ' do delete(s,1,1);
		if s[1]='#' then break;
		r:=0;tot:=0;
		val(copy(s,1,pos(' ',s)-1),n);val(copy(s,pos(' ',s)+1,length(s)-pos(' ',s)),v);
		fillchar(f,sizeof(f),$3F);
		fillchar(w,sizeof(w),0);w[0]:=$3f3f3f3f;
		fillchar(head,sizeof(head),0);
		fillchar(qu,sizeof(qu),0);
		//fillchar(vi,sizeof(vi),0);
		fillchar(ind,sizeof(ind),0);
		for i:=1 to n do
			begin
				readln(s);
				deal(s,i);
			end;
		for i:=1 to r do
			if (ind[i]=0) then
				add(0,i);
		for i:=1 to r do f[i,0]:=0;
		dfs(0);
		for i:=v to n do
			if f[0,i]<w[0] then w[0]:=f[0,i];
		writeln(w[0]);
	End;
	//close(output);
end.
