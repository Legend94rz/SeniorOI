var
	tot,i,j,n,m:longint;
	ans:int64;
	head,ed,e,next:array[0..1500001]of longint;
	count,d:array[0..200001]of longint;
	x,y,z:longint;
    q:array[0..25000001]of longint;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure spfa;
var
	l,r:longint;
	v:array[0..100001]of boolean;
	k,b,ege:longint;
begin
	fillchar(v,sizeof(v),0);v[0]:=true;
	fillchar(d,sizeof(d),0);d[0]:=0;
	l:=0;r:=1;q[1]:=0;count[0]:=1;
	repeat
		inc(l);//if l>=20000000 then l:=1;
		k:=q[l];v[k]:=false;
		ege:=head[k];
		while ege<>0 do
			begin
				b:=ed[ege];
				if d[k]+e[ege]>d[b] then
					begin
						d[b]:=d[k]+e[ege];
						if not v[b] then
							begin
								inc(r);//if r>=20000000 then r:=1;
								q[r]:=b;v[b]:=true;inc(count[b]);
								if count[b]>=n then begin writeln(-1);halt;end;
							end;
					end;
                ege:=next[ege];
			end;
	until l=r;
end;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
begin
//	assign(output,'test.txt');rewrite(output);
	readln(n,m);
	for i:=1 to m do
		begin
			readln(z,x,y);
			if (x=y)and((z=2)or(z=4)) then begin writeln(-1);exit;end;
			case z of
				1:begin add(x,y,0);add(y,x,0);end;
				2:add(x,y,1);
				3:add(y,x,0);
				4:add(y,x,1);
				5:add(x,y,0);
			end;
		end;
	for I:=1 to n do add(0,i,1);
	spfa;
	for i:=1 to n do inc(ans,d[i]);
	writeln(ans);
end.

