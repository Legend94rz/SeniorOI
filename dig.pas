var
	i,j,n,m:longint;
	k1,k2,vw,vc,x0,d:double;
	b:array[0..1001]of boolean;
	x,y:array[0..1001]of double;
	head,ed,next:array[0..400001]of longint;
	e:array[0..400001]of double;
	tot:longint;
	p:array[0..1001]of double;
	vis:array[0..1001]of boolean;
	q:array[0..10001]of longint;
function getx(i,j:longint):double;
var
	k:double;
begin
	k:=(y[j]-y[j-1])/(x[j]-x[j-1]);
	getx:=(y[i]+k*x[j]-y[j])/k;
end;
procedure spfa;
var
	i:longint;
	l,r,ege,k,b:longint;
begin
	for i:=0 to n do p[i]:=$7f7f7f7f;
	l:=0;r:=1;q[r]:=1;vis[1]:=true;p[1]:=0;
	repeat
		inc(l);if l>=10000 then l:=1;
		k:=q[l];vis[k]:=false;
		ege:=head[k];
		while ege>0 do
			begin
				b:=ed[ege];//writeln('>>>',k, '+',b,'+',ege);
				if p[k]+e[ege]<p[b] then
					begin
						p[b]:=p[k]+e[ege];
						if (not vis[b]) then
							begin
								inc(r);if r>=10000 then r:=1;
								q[r]:=b;vis[b]:=true;
							end;
					end;
				ege:=next[ege];
			end;
		//writeln(l,'---',r);
	until l=r;
	writeln(p[n]:0:6);
end;
procedure add(x,y:longint;z:double);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure print;
var
	k,b,ege:longint;
begin
	for i:=1 to n do
		begin
			write(i);
			ege:=head[i];
			while ege<>0 do
				begin
					if e[ege]<=0 then begin ege:=next[ege];continue;end;
					write('->',ed[ege],'[',e[ege]:0:3,']');
					ege:=next[ege];
                end;
			writeln;
        end;
end;
begin
	assign(input,'dig.in');reset(input);assign(output,'dig.out');rewrite(output);
	readln(n);
	readln(vw,vc);// É½/ËíµÀ
	for I:=1 to n do
		begin
	        readln(x[i],y[i]);
			if i>=2 then
				begin
					d:=sqrt(sqr(x[i]-x[i-1])+sqr(y[i]-y[i-1]));
					add(i-1,i,d/vw);//add(i,i-1,d/vw);
				end;
		end;
    for i:=1 to n do
		begin
			if i>1 then k1:=(y[i]-y[i-1])/(x[i]-x[i-1]);if i<n then k2:=(y[i+1]-y[i])/(x[i+1]-x[i]);
			if (k1<0)and(k2>0)or(i=1)and(k2>0)or(i=n)and(k1<0) then
				begin
					for j:=i-1 downto 2 do
						begin
							k1:=(y[j]-y[j-1])/(x[j]-x[j-1]);
							if (k1>0)and(y[j-1]<=y[i])and(y[j]>y[i]) then
								begin
									x0:=getx(i,j);
									d:=(x[i]-x0)/vc+(sqrt( sqr(x[j-1]-x0)+sqr(y[j-1]-y[i]) ))/vw;
									add(j-1,i,d);//add(i,j,d);
									break;
                                end;
                        end;
					for j:=i+1 to n-1 do
						begin
							k1:=(y[j]-y[j+1])/(x[j]-x[j+1]);
							if (k1<0)and(y[j+1]<=y[i])and(y[j]>y[i]) then
								begin
									x0:=getx(i,j+1);
									d:=(x0-x[i])/vc+(sqrt( sqr( x0-x[j+1] )+sqr(y[i]-y[j+1] ) ))/vw;
									add(i,j+1,d);//add(j+1,i,d);
									break;
                                end;
                        end;
                end;
        end;
	//print;
	spfa;
	close(output);
end.

