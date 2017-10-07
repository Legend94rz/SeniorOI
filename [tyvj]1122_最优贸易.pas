var
	i,j,n,m,ans,count,x,y,z:longint;
	tot:longint;
	a,point:array[0..200001]of longint;
	head,ed,next:array[0..2000001]of longint;
procedure add(x,y:longint);
begin
	inc(tot);
	ed[tot]:=y;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure spfa;
var
	l,r,k,b,ege:longint;
	d,q:array[0..200001]of longint;
	v,v2:array[0..200001]of boolean;
	flag:boolean;
begin
	fillchar(d,sizeof(d),0);l:=0;r:=1;q[r]:=1;fillchar(v,sizeof(v),0);v[1]:=true;
	fillchar(v2,sizeof(v2),0);v2[1]:=true;
	repeat
		inc(l);if l>=200000 then l:=1;
		k:=q[l];v[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];flag:=false;
				if a[point[k]]<a[point[b]] then
					begin
						point[b]:=point[k];
						d[b]:=a[b]-a[point[b]];flag:=true;
                    end;
				if d[b]<d[k] then begin d[b]:=d[k];flag:=true;end;
				if (flag and not v[b])or (not v2[b])then begin
					v[b]:=true;v2[b]:=true;
					inc(r); if r>=200000 then r:=1;
					q[r]:=b;
				end;
				ege:=next[ege];
			end;
	until l=r;
	writeln(d[n]);
end;
begin
	//assign(input,'trade6.in');reset(input);
	readln(n,m);
	for i:=1 to n do begin read(a[i]);point[i]:=i;end;
	for I:=1 to m do
		begin
			readln(x,y,z);add(x,y);
			if z=2 then add(y,x);
        end;
	spfa;
end.

