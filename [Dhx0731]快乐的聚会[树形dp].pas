var
	i,j,n,m,P:longint;
	Name:array[0..1001]of string;
	La,tot:longint;
	ed,next,Head:array[0..100001]of longint;
	s,t1,t2,vue:string;
	Happy,ind:array[0..1001]of longint;
	v:array[0..10001]of boolean;
	f:array[0..10001,0..1]of longint;
function GetPos(s:string):longint;
var
	I:longint;
begin
	for i:=1 to La do
		if Name[i]=s then
			exit(i);
	inc(La);Name[La]:=s;
	exit(La);
end;
procedure add(x,y:longint);
begin
	inc(tot);inc(ind[y]);
	//writeln('>>',x,'->',y);
	ed[tot]:=y;
	next[tot]:=head[x];
	head[x]:=tot;
end;
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
procedure dfs(x:longint);
var
	b,ege:longint;
begin
	v[x]:=true;
	//writeln('dfs ',x);
	ege:=head[x];
	while ege<>0 do
		begin
			b:=ed[ege];
			if not v[b] then
				begin
					dfs(b);
					inc(f[x,1],f[b,0]);
					inc(f[x,0],max(f[b,1],f[b,0]));
                    //if b=4 then writeln('<2>',f[b,1],' ',f[b,0],' ',f[x,0]);
                end;
			ege:=next[ege];
		end;
	inc(f[x,1],Happy[x]);
    //if x=4 then writeln('<1>',f[4,1],' ',f[4,0]);
end;
begin
	assign(input,'party.in');reset(input);assign(output,'party.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		begin
			readln(s);
			p:=Pos(' ',s);t1:=copy(s,1,p-1);delete(s,1,p);
			p:=Pos(' ',s);vue:=copy(s,1,p-1);delete(s,1,p);
			t2:=s;p:=GetPos(t1);
            val(vue,Happy[p]);
			add(GetPos(t2),p);
		end;
	for i:=1 to la do //writeln('>>',happy[i],'*');
		if ind[i]=0 then
			begin
				dfs(ed[head[i]]);
				break;
			end;
	writeln(max(f[ed[head[i]],0],f[ed[head[i]],1]));
	close(output);
end.

