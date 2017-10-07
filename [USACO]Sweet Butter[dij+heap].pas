{
id:rz109291
PROG:butter
LANG:PASCAL
}
type
	heap=record
		d,no:longint;
	end;
var
	i,j,n,m,pp,x,y,z,tot,ans,t,pt:longint;
	p,num:array[0..10001]of longint;
	a:array[0..400001]of heap;
	head,ed,e,next:array[0..10001]of longint;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure swap(x,y:longint);
var
	t:heap;
begin
	p[a[x].no]:=y;p[a[y].no]:=x;
	t:=a[x];a[x]:=a[y];a[y]:=t;
end;
procedure up(x:longint);
begin
	while (x shr 1>=1)and(a[x].d<a[x shr 1].d) do begin swap(x,x shr 1);x:=x shr 1;end;
end;
procedure down(x:longint);
var
	t,j:longint;
begin
	j:=x shl 1;
	while j<=pt do
		begin
			if (j<pt)and(a[j].d>a[j+1].d) then inc(j);
			if a[j].d<a[j shr 1].d then
				begin
					swap(j,j shr 1);
					j:=j shl 1;
				end
			else
				break;
        end;
end;
procedure dij;
var
	ege,k,b:longint;
	mint:longint;
	t:heap;
	i:longint;
begin
	while true do
		begin
			mint:=a[1].d;k:=a[1].no;swap(1,pt);dec(pt);down(1);
			//for i:=1 to pp do writeln(i,' ',a[p[i]].d,' ',pt);writeln('------------');
			//if (mint=$3f3f3f3f)or(pt<0) then break;
			//writeln(mint,' ',k);
			ege:=head[k];
			while ege<>0 do
				begin
					b:=ed[ege];
					if mint+e[ege]<a[p[b]].d then
						begin
		                    a[p[b]].d:=mint+e[ege];
							up(p[b]);
						end;
					ege:=next[ege];
				end;
			if pt=1 then break;
			//for i:=1 to pp do writeln(i,' ',a[p[i]].d);writeln('------------');
        end;
end;
begin
	assign(input,'butter.in');reset(input);assign(output,'butter.out');rewrite(output);
	readln(n,pp,m);
	for i:=1 to n do
		begin
		    readln(x);
			inc(num[x]);
		end;
	for I:=1 to m do
		begin
			readln(x,y,z);
			add(x,y,z);add(y,x,z);
        end;
	ans:=maxlongint;
	for i:=1 to pp do
		begin
            //-------init--------------
			pt:=pp;
			for j:=1 to pp do begin a[j].d:=$3f3f3f3f;p[j]:=j;a[j].no:=j;end;
			a[i].d:=0;swap(1,i);
            //-------------------------
            dij;
            t:=0;
			for j:=1 to pp do begin {writeln(a[p[j]].d,' ');}inc(t,a[p[j]].d*num[j]);end;
            //writeln('==============');
			if t<ans then ans:=t;
		end;
	writeln(ans);
	close(output);
end.

