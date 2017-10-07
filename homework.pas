var
	i,j,n,m,tot,ans,x,y,z:longint;
	head,ed,e,next:array[0..400001]of longint;
	q,d,ind:array[0..100001]of longint;
	v:array[0..100001]of boolean;
procedure add(x,y,z:longint);
begin
	inc(tot);
	//writeln('add ',x,' ',y,' ',z);//////////////////////
	inc(ind[y]);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
procedure spfa;
var
	l,r,k,b,ege,i:longint;
begin
	fillchar(d,sizeof(d),0);fillchar(v,sizeof(v),0);
	l:=0;r:=1;q[r]:=0;v[0]:=true;
	repeat
		inc(l);if L>=100000 then l:=1;
		k:=q[l];v[k]:=false;
		ege:=head[k];
		while ege>0 do
			begin
				b:=ed[ege];
				if d[k]+e[ege]>d[b] then
					begin
						d[b]:=d[k]+e[ege];
						if not v[b] then
							begin
								inc(r);if r>=100000 then r:=1;
								q[r]:=b;v[b]:=true;
                            end;
                    end;
				ege:=next[ege];
            end;
	until l=r;
	for i:=1 to n do if d[i]>ans then ans:=d[i];
	writeln(ans);
end;
begin
	assign(input,'homework.in');reset(input);assign(output,'homework.out');rewrite(output);
	readln(n,m);//s:0
	for i:=1 to m do
		begin
			readln(x,y,z);
			add(x+1,y+1,z);
		end;
	for i:=1 to n do if ind[i]=0 then add(0,i,1);
	spfa;
	close(output);
end.

