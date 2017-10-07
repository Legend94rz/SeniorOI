var
	w,g:array[0..2500,0..2500]of longint;
	i,j,n,m,s,t,minp,min0,a,b,e:longint;
	v:array[0..2500]of longint;
	vh:array[0..2000]of boolean;
	d:array[0..2500]of longint;
begin
	readln(n,m,s,t);
	for i:=1 to m do
		begin
			readln(a,b,e);
			inc(v[a]);
			g[a,v[a]]:=b;
			w[a,v[a]]:=e;
			inc(v[b]);
			g[b,v[b]]:=a;
			w[b,v[b]]:=e;
		end;
	fillchar(d,sizeof (d),$3f);
	fillchar(vh,sizeof(vh),0);
	d[s]:=0;minp:=s;
	for i:=1 to n do
		begin
			vh[minp]:=true;min0:=minp;minp:=0;
			for j:=1 to v[min0] do
				if d[min0]+w[min0,j]<d[g[min0,j]]then
					d[g[min0,j]]:=d[min0]+w[min0,j];
			for j:=1 to n do
				if (not vh[j])then
					if (d[j]<d[minp]) then
						minp:=j;
		end;
        writeln(d[t]);
end.
