program charge;
uses
	math;
var
	f:array[0..10005,0..510]of longint;
	i,j,n,m,x,y,c:longint;
	next,head,ed,w:array[0..10005]of longint;
procedure add(no,d,val:longint);
begin
	w[d]:=val;
	ed[d]:=d;
	next[d]:=head[no];
	head[no]:=d;
end;
procedure bag(s,v:longint);
var
	i,j,k:longint;
	Aedge:longint;
begin
	Aedge:=head[s];
	while Aedge<>0 do
		begin
			k:=ed[Aedge];
			for i:=1 to c do
				f[k,i]:=f[s,i];
			bag(k,c-1);
			for i:=1 to c do
				f[s,i]:=max(f[s,i],f[k,i-1]+w[k]);
			Aedge:=next[Aedge];
		end;
end;
begin
	assign(input,'charge.in');assign(output,'charge.out');reset(input);rewrite(output);
	readln(n,c);
	for i:=1 to n do
		begin
			readln(x,y);
			add(x,i,y);
		End;
	bag(0,c-1);
	writeln(f[0,c-1]+40000000);
	close(input);close(output);
end.
